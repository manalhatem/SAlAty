import 'package:flutter/material.dart';
import 'package:salaty/component/custom_text.dart';
import 'package:salaty/component/style/colors.dart';

import '../../../component/custom_appbar.dart';
import '../../../component/style/size.dart';
import '../../home/widgets/element_product.dart';
class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Men Clother', context),
          body: Padding(
        padding: EdgeInsets.only(left: height(context)*0.02,right:height(context)*0.02,top: height(context)*0.05, ),
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1/1.5
            ),
            itemBuilder: (context,index){
              return ElementProduct();
            }
        ),
      ),
    );
  }
}
