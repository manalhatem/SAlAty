import 'package:flutter/material.dart';
import '../../../../component/custom_text.dart';
import '../../../../component/style/colors.dart';
import '../../../../utilities/routes.dart';
class CustomRow extends StatelessWidget {
   CustomRow({Key? key,required this.text1,required this.text2,required this.routeName}) : super(key: key);

  String text1, text2;
  String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text:text1, size: 15,color: Colors.black54,fontfam: 'Janna LT'),
        GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, routeName);
            },
            child: CustomText(text:text2, color: AppColor.mainColor,fontfam: 'Janna LT'))
      ],
    );
  }
}
