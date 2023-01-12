import 'package:flutter/material.dart';

import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
class ElementProduct extends StatelessWidget {
  const ElementProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(height(context)*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            color: Colors.grey,
            width: 1.5
        ),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline,
                size: 32,color: Colors.grey,))),
          Center(child: Image.asset('assets/images/salalogo.png',height: height(context)*0.1,)),
          CustomText(text: 'AppleApple', color: Colors.black,fontfam: 'Janna LT',
            size: 19,max: 2,),
          CustomText(text: '\$77777', color: AppColor.mainColor,fontfam:'Janna LT' ,size: 18,),

        ],
      ),
    );
  }
}
