import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';

Widget  buildDot({required int index, required int currentIndex}){
  return Container(
    width:currentIndex==index? 30:10,
    height: 10,
    margin: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: currentIndex==index? AppColor.mainColor:Colors.grey,
      borderRadius: BorderRadius.circular(20),

    ),
  );
}

Widget buildCarousel(cubit,context){
  return  CarouselSlider.builder(
      itemCount: 3,
      carouselController: cubit.controller,
      itemBuilder: (context,index, realIdx){
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: height(context)*0.01,
                  vertical:height(context)*0.02 ),
              child: Image.asset('assets/images/salalogo.png',
               // cubit.homeModel!.data!.banners![index].image!,
                height: height(context)*0.21,),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return buildDot(index:index, currentIndex: cubit.currentIndex);
                }),
              ),
            ),

          ],
        );
      },
      options: CarouselOptions(
          autoPlay: true,
          height: height(context)*0.28,
          onPageChanged: (val,_){
            print(val);
            cubit.changeIndex(val);
          }
      ));
}