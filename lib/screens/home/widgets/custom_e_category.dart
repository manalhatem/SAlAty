import 'package:flutter/material.dart';

import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
class ElementCategory extends StatelessWidget {
   ElementCategory({Key? key,required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: height(context)*0.012,vertical:height(context)*0.013 ),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.mainColor,
              width: 1.5
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: CustomText(text: text,color: Colors.black,fontfam: 'Janna LT',
        size: 16,),

    );
  }
}
