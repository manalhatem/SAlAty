import 'package:flutter/material.dart';

import '../../../component/custom_text.dart';
import '../../../component/style/colors.dart';
import '../../../component/style/size.dart';
import '../../../utilities/routes.dart';
import '../widgets/ele_category.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
        return CategoryElement(routeName: AppRoutes.catDetail,);
      })
    );
  }
}
