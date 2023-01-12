import 'package:flutter/material.dart';

import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
class CategoryElement extends StatelessWidget {
   CategoryElement({Key? key,required this.routeName}) : super(key: key);

  String routeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(height(context)*0.02),
      child: Container(
          padding: EdgeInsets.all(height(context)*0.009),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey.withOpacity(.6),
                  width: 1.5
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          child: InkWell(
            onTap: (){Navigator.pushNamed(context, routeName);},
            child: Row(
              children: [
                Image.asset('assets/images/salalogo.png',width: height(context)*0.13,),
                SizedBox(width: width(context)*0.04,),
                CustomText(text: 'Men Clothes', color: Colors.black,fontWeight: FontWeight.w500,size: 19,),
                SizedBox(width: width(context)*0.1,),
                IconButton(onPressed: (){}, icon: Icon(
                  Icons.arrow_forward_ios_rounded,color: AppColor.mainColor,size: 28,)),
              ],


            ),
          )
      ),
    );
  }
}
