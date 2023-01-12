import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salaty/component/custom_text.dart';
import 'package:salaty/component/style/size.dart';
import 'package:salaty/screens/home/controller/home_states.dart';

import '../../../component/style/colors.dart';
import '../controller/home_cubit.dart';
import '../widgets/carouselSlider.dart';
import '../widgets/custom_e_category.dart';
import '../widgets/custom_row.dart';
import '../widgets/element_product.dart';
class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> HomeCubit()..getHome(context),
      child: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context,state){
          final cubit =HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: CustomText(text: 'Salaa', color: AppColor.mainColor,fontfam: 'Pacifico-Regular',
                size: 25,fontWeight: FontWeight.w500,),
              leading: Padding(
                padding:  EdgeInsets.only(top: height(context)*0.009,left:height(context)*0.02 ),
                child: CircleAvatar(
                  backgroundColor: AppColor.mainColor,
                  child: Image.asset('assets/images/salalogo.png',width: 32,),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: height(context)*0.003,right:height(context)*0.02 ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColor.mainColor,size: 38,)),
                ),
              ],
            ),
            body: Column(
                children: [
                  buildCarousel(cubit,context),
                  CustomRow(title: 'Category',subTitle: 'see all',onTap: (){},),
                  SizedBox(
                    height: height(context)*0.085,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: height(context)*0.015),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          scrollDirection:Axis.horizontal,
                          itemCount: 3,
                          itemBuilder:
                          (context,index){
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height(context)*0.01),
                          child: ElementCategory(text: 'electronic electronic',),
                        );
                      }),
                    ),
                  ),
                  CustomRow(title: 'Product',onTap: (){},),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: height(context)*0.02),
                      child: GridView.builder(
                        itemCount: 4,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: .9/1.292
                          ),
                          itemBuilder: (context,index){
                            return ElementProduct();
                          }
                      ),
                    ),
                  )



                ],
              ),

          );

        },

      ),
    );
  }


}

