import 'package:flutter/material.dart';
import 'package:salaty/component/style/colors.dart';
import 'package:salaty/component/style/size.dart';

import ' category/views/category_view.dart';
import 'cart/view/cart_view.dart';
import 'favourite/view/favourite_view.dart';
import 'home/views/home_view.dart';
import 'setting/view/setting_view.dart';
class BtnNavBAr extends StatefulWidget {
  const BtnNavBAr({Key? key}) : super(key: key);

  @override
  State<BtnNavBAr> createState() => _BtnNavBArState();
}

class _BtnNavBArState extends State<BtnNavBAr> {
  int currentTap=0;
  List pages=[
    HomeView(),
    CategoryView(),
    CartView(),
    FavouriteView(),
    SettingView(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTap],
      floatingActionButton:FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        onPressed: (){
          setState(() {
            currentTap=2;
          });
        },
        child: const Icon(Icons.shopping_cart), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        color:Colors.white,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 12, //notche margin between floating button and bottom appbar
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: height(context)*0.02),
          height: height(context)*0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))
          ),
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home_outlined, color:  currentTap == 0?AppColor.mainColor:Colors.grey,size: 30,), onPressed: () {
                setState(() {
                  currentTap=0;
                });
              },),
              IconButton(icon: Icon(Icons.category_outlined, color:
               currentTap == 1?AppColor.mainColor:Colors.grey,size: 30), onPressed: () {
                setState(() {
                  currentTap=1;
                });
              },),
              SizedBox(width: height(context)*0.04,),
              IconButton(icon: Icon(Icons.favorite_outline, color:  currentTap == 3?AppColor.mainColor:Colors.grey,size: 30), onPressed: () {
                setState(() {
                  currentTap=3;
                });
              },),
              IconButton(icon: Icon(Icons.settings, color:  currentTap == 4?AppColor.mainColor:Colors.grey,size: 30), onPressed: () {
                setState(() {
                  currentTap=4;
                });
              },),
            ],
          ),
        ),
      ),
    );
  }
}
