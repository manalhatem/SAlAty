import 'package:flutter/material.dart';

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
        Column(
        children: [
          Image.asset('assets/images/salalogo.png',width: width(context)*0.5,),
          CustomText(text: 'Shopping Now', color: Colors.black54,size: 30,fontWeight: FontWeight.bold,
            fontfam: 'Janna LT',),
          CustomText(text: 'Welcome to Application',color: Colors.black54,
              align: TextAlign.center,fontWeight: FontWeight.w500,
              size: 17),
          CustomBtn(text: 'LOGIN',ontap: (){},col: AppColor.mainColor,weight: FontWeight.bold,size: 18,),
          CustomBtn(text: 'SIGN UP',ontap: (){},col: Colors.grey.withOpacity(0.2),textColor: Colors.black,
             weight: FontWeight.w500,size: 18),
        ],
        ),),
    );
  }
}
