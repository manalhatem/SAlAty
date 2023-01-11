import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salaty/component/custom_btn.dart';
import 'package:salaty/component/custom_text.dart';
import 'package:salaty/component/style/colors.dart';
import 'package:salaty/component/style/size.dart';
import 'package:salaty/utilities/routes.dart';

import '../../../../component/custom_text_field.dart';
import '../controller/register_cubit.dart';
import '../controller/register_states.dart';
import '../widgets/custom_row.dart';
class RegisterView extends StatelessWidget {
   const RegisterView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
    child: BlocBuilder<RegisterCubit,RegisterStates>(
        builder: (context,state){
         final cubit=RegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:  EdgeInsets.only(right: height(context)*0.02,left: height(context)*0.02,
                      top:  height(context)*0.1),
                  child: Form(
                    key: cubit.globalKey,
                    child: Column(
                      children: [
                        CustomText(text: 'Sign Up Now', color: Colors.black54,
                            fontWeight: FontWeight.w500,size: 28),
                        SizedBox(height: height(context)*0.009,),
                        CustomText(text: 'login now to browse our hot offers ', color: Colors.black54,
                          fontWeight: FontWeight.w400,size: 14,fontfam: 'Janna LT',),
                        SizedBox(height: height(context)*0.033,),
                        CustomTextField(hintName: 'Name',prefix: Icons.person,save: (value){
                          cubit.name=value;}, secure: false,type: TextInputType.text,),
                        SizedBox(height: height(context)*0.03,),
                        CustomTextField(hintName: 'Email Address',prefix: Icons.email,
                          save: (value){cubit.email=value;},
                          secure: false,type: TextInputType.emailAddress,),
                        SizedBox(height: height(context)*0.03,),
                        CustomTextField(hintName: 'Phone',prefix: Icons.phone,save: (value){
                          cubit.phone=value;}, secure: false,type: TextInputType.number, ),
                        SizedBox(height: height(context)*0.03,),
                        CustomTextField(hintName: 'Password',prefix: Icons.lock,save: (value){
                          cubit.password=value;}, secure: cubit.visible,type: TextInputType.visiblePassword,
                           suffix: IconButton(onPressed: (){cubit.changeVisible();},
                            icon: Icon(cubit.visible? Icons.visibility_off_outlined:Icons.visibility_outlined,color: AppColor.mainColor,)),),
                        SizedBox(height: height(context)*0.03,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height(context)*0.044),
                          child: CustomBtn(text: 'Sign Up',weight: FontWeight.w500,col: AppColor.mainColor,textColor:Colors.white,size: 18,
                          ontap: (){
                            if(cubit.globalKey.currentState!.validate()){
                              cubit.globalKey.currentState!.save();
                              print(cubit.phone);
                              cubit.register(context);
                            }
                          },),
                        ),
                        SizedBox(height: height(context)*0.02,),
                         CustomRow(text1: 'Already have an account?  ',
                         text2:  'Login', routeName: AppRoutes.login,),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
      )
    );
  }
}
