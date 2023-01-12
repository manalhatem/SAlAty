import 'package:flutter/material.dart';
import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: height(context)*0.03),
      height: height(context)*0.21,
      child: Row(
        children: [
          Image.asset('assets/images/salalogo.png',width: width(context)*0.3,),
          SizedBox(width: width(context)*0.08,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height(context)*.018,),
              SizedBox(
                height: height(context)*0.079,
                width: width(context)*0.5,
                child: CustomText(text: 'Apple iphone 12 Pro MAx ',
                  max: 2,size: 18,
                  color: Colors.black54,),
              ),
              CustomText(text: '25000', color: AppColor.mainColor,size: 16,fontWeight: FontWeight.w500,),
              SizedBox(height: width(context)*0.007,),
              Row(
                children: [
                  SizedBox(width: width(context)*0.09,),
                  CircleAvatar(
                    backgroundColor: AppColor.mainColor,
                    child: IconButton(
                      icon: const Icon(Icons.add,color: Colors.white,), onPressed: () {},
                    ),
                  ),
                  CustomText(text: ' 3 ', color: Colors.black,fontWeight: FontWeight.bold,size: 22,),
                  CircleAvatar(
                    backgroundColor: AppColor.mainColor,
                    child: IconButton(
                      icon: const Icon(Icons.remove,color: Colors.white,), onPressed: () { },
                    ),
                  ),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.red,size: 34,)),
                ],
              ),
            ],),
        ],
      ),
    );
  }
}
