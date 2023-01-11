import 'package:flutter/material.dart';
import 'package:salaty/component/style/colors.dart';
import 'package:salaty/component/style/size.dart';

import 'custom_text.dart';
class CustomBtn extends StatelessWidget {
   CustomBtn({Key? key,required this.text,this.ontap,this.size,this.col,this.fam,this.weight,this.textColor}) : super(key: key);

  void Function()? ontap;
  String text;
  double? size;
  Color? col;
   FontWeight? weight;
   String? fam;
   Color? textColor;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(height(context)*.026),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(child: CustomText(
          fontWeight: weight,
          fontfam: fam,
          text: text,color: textColor!=null?textColor!:Colors.white,size: size,)),
      ),
    );
  }
}
