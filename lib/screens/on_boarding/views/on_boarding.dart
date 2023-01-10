import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salaty/component/custom_text.dart';
import 'package:salaty/component/style/colors.dart';
import 'package:salaty/component/style/size.dart';

import '../../../component/custom_btn.dart';
import '../../../utilities/routes.dart';
import '../model/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex=0;
  PageController? _controller;
  @override
  void initState() {
    _controller=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child:Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (int index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                  itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.only(top:height(context)*0.1,right: height(context)*0.04,left: height(context)*0.04 ),
                      child: Column(
                      children: [
                        Image.asset(itemsBoard[index].img,height: height(context)*.4,),
                        SizedBox(height: height(context)*0.01,),
                        CustomText(text: itemsBoard[index].title, color: Colors.black54,size: 30,fontWeight: FontWeight.bold,
                        fontfam: 'Janna LT',),
                        SizedBox(height: height(context)*0.014,),
                        CustomText(text: itemsBoard[index].body,color: Colors.black54,
                        align: TextAlign.center,fontWeight: FontWeight.w500,
                        size: 17)
                      ],
                    ),
                  );

                },itemCount: itemsBoard.length,),
              ),
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: List.generate(itemsBoard.length, (index) {
                   return buildDot(index);
                 }),
               ),
             ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: height(context)*.04,horizontal:height(context)*.055 ),
                child:
                currentIndex==itemsBoard.length -1?
                CustomBtn(text: 'Start',ontap: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.welcome);
                },col: AppColor.mainColor,) :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap:(){
                          Navigator.pushReplacementNamed(context, AppRoutes.welcome);
                        },
                        child: CustomText(text: 'Skip', color: AppColor.mainColor,size: 18,fontWeight: FontWeight.w500,)),
                   CustomBtn(text: 'NEXT',
                     col: AppColor.mainColor,
                     ontap: (){
                     _controller!.nextPage(duration:Duration(milliseconds: 100) ,
                         curve: Curves.bounceInOut);
                   },)
                  ],
                ),
              ),


            ],
          ),
        )
      );

  }

Widget  buildDot(int index){
   return Container(
      width: currentIndex==index? 25:10,
      height: 10,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: currentIndex==index? AppColor.mainColor:Colors.grey,
        borderRadius: BorderRadius.circular(20),

      ),
    );
  }
}
//Scaffold(
//           body: IntroductionScreen(
//             done: Container(
//               decoration: BoxDecoration(
//                 color: AppColor.mainColor
//               ),
//               child: CustomText(text: '', color: null,),
//             ),
//             pages: [
//               PageViewModel(title:'Online Shopping',
//               body: 'You can shopping anytime, anywhere that you want.',
//               image: Image.asset('assets/images/onboarding_1.png')),
//               PageViewModel(title:'Mobile Payment',
//                   body:  'Download our shopping application and buy using your smartphone or laptop.',
//                   image: Image.asset('assets/images/onboarding_2.png')),
//               PageViewModel(title:'Delivery Service',
//                   body:  'Modern delivering technologies.The products you order will be delivered to your address.',
//                   image: Image.asset('assets/images/onboarding_3.png'),
//               footer: Container(
// 
//               )),
//             ],
//           ),
// 
//     ));