import 'package:flutter/material.dart';
import 'package:salaty/component/custom_text.dart';

import '../component/fade_animate.dart';
import '../component/style/colors.dart';
import '../component/style/images.dart';
import '../component/style/size.dart';
import '../utilities/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      return  Navigator.pushNamed(context, AppRoutes.onBoarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child:
        FadeAnimation(
          1,
          2,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo,width: 0.5*width(context)),
                SizedBox(
                  height: 0.05*height(context),
                ),
                CustomText(text: 'Sala App', color: Colors.black54,fontWeight: FontWeight.bold,size: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
