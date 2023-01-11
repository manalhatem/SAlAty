import 'package:flutter/material.dart';
import 'package:salaty/utilities/routes.dart';

import '../../component/custom_btn.dart';
import '../../component/custom_text.dart';
import '../../component/style/colors.dart';
import '../../component/style/size.dart';
class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Padding(
          padding:  EdgeInsets.only(top: height(context)*0.15,right: height(context)*0.035,
          left: height(context)*0.035),
          child: Column(
          children: [
            Image.asset('assets/images/salalogo.png',width: width(context)*0.5,),
            SizedBox(height: height(context)*0.02,),
            CustomText(text: 'Shopping Now', color: Colors.black54,size: 30,fontWeight: FontWeight.bold,
              fontfam: 'Janna LT',),
            SizedBox(height: height(context)*0.008,),
            CustomText(text: 'Welcome to Application',color: Colors.black54,
                align: TextAlign.center,fontWeight: FontWeight.w500,
                size: 17),
            SizedBox(height: height(context)*0.035,),
            CustomBtn(text: 'LOGIN',ontap: (){
              Navigator.pushNamed(context, AppRoutes.login);
            },col: AppColor.mainColor,weight: FontWeight.bold,size: 19,),
            SizedBox(height: height(context)*0.025,),
            CustomBtn(text: 'SIGN UP',ontap: (){
              Navigator.pushNamed(context,AppRoutes.register );
            },col: Colors.grey.withOpacity(0.15),textColor: Colors.black,
               weight: FontWeight.w500,size: 19),
          ],
          ),
        ),),
    );
  }
}
