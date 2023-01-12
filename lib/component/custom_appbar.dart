import 'package:flutter/material.dart';
import 'package:salaty/component/style/colors.dart';

import 'custom_text.dart';
PreferredSizeWidget? appBar(title,context){
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0.0,
    title: CustomText(text: title, color: Colors.black,fontWeight: FontWeight.w500,),
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    },icon: Icon(Icons.arrow_back_ios_new_rounded,color: AppColor.mainColor,),),
  );
}
