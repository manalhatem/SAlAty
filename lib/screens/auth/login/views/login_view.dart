import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salaty/screens/auth/login/controller/login_cubit.dart';
import '../../../../component/custom_btn.dart';
import '../../../../component/custom_text.dart';
import '../../../../component/custom_text_field.dart';
import '../../../../component/style/colors.dart';
import '../../../../component/style/size.dart';
import '../../../../utilities/routes.dart';
import '../../register/widgets/custom_row.dart';
import '../controller/login_states.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>LoginCubit(),
        child: BlocBuilder<LoginCubit,LoginStates>(
          builder: (context,state){
            final cubit=LoginCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:  EdgeInsets.only(right: height(context)*0.02,left: height(context)*0.02,
                        top:  height(context)*0.2),
                    child: Form(
                      key: cubit.globalKey,
                      child: Column(
                        children: [
                          CustomText(text: 'Login Now', color: Colors.black54,
                              fontWeight: FontWeight.w500,size: 28),
                          SizedBox(height: height(context)*0.01,),
                          CustomText(text: 'login now to browse our hot offers ', color: Colors.black54,
                            fontWeight: FontWeight.w400,size: 14,fontfam: 'Janna LT',),
                          SizedBox(height: height(context)*0.04,),
                          CustomTextField(hintName: 'Email Address',prefix: Icons.email,
                            save: (value){cubit.email=value;},
                            secure: false,type: TextInputType.emailAddress,),
                          SizedBox(height: height(context)*0.03,),
                          CustomTextField(hintName: 'Password',prefix: Icons.lock,save: (value){
                            cubit.password=value;}, secure: cubit.visible,type: TextInputType.visiblePassword,
                            suffix: IconButton(onPressed: (){cubit.changeVisible();},
                                icon: Icon(cubit.visible? Icons.visibility_off_outlined:Icons.visibility_outlined,color: AppColor.mainColor,)),),
                          SizedBox(height: height(context)*0.03,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: height(context)*0.044),
                            child: CustomBtn(text: 'LOGIN',weight: FontWeight.w500,col: AppColor.mainColor,textColor:Colors.white,size: 18,
                              ontap: (){
                                if(cubit.globalKey.currentState!.validate()){
                                  cubit.globalKey.currentState!.save();
                                  print(cubit.email);
                                  cubit.login(context);
                                }
                              },),
                          ),
                          SizedBox(height: height(context)*0.02,),
                          CustomRow(text1: 'Don\'t have an account ?  ',
                            text2:  'Sign up....', routeName: AppRoutes.register,),

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
