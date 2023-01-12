import 'package:flutter/material.dart';

import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
class CustomRow extends StatelessWidget {
   CustomRow({Key? key, required this.title, this.subTitle='',this.onTap}) : super(key: key);
  String title;
  String? subTitle;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: height(context)*0.02),
      child: Row(
        children: [
          CustomText(text: title, color: AppColor.mainColor,fontfam: 'Janna LT',size: 26,
            fontWeight: FontWeight.bold,),
          const Spacer(),
          GestureDetector(
              onTap: onTap,
              child: CustomText(text: subTitle!, color: AppColor.mainColor, fontfam: 'Janna LT',size: 20,))
        ],
      ),
    );
  }
}
