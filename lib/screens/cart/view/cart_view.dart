import 'package:flutter/material.dart';
import 'package:salaty/component/custom_text.dart';
import 'package:salaty/component/style/colors.dart';
import 'package:salaty/component/style/size.dart';

import '../../../component/custom_appbar.dart';
import '../widgets/cart_item.dart';
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Cart',context),
      body: ListView.separated(
          itemBuilder: (context,index){
            return CartItem();
          },
          separatorBuilder: (context,index){
            return const Divider(color: Colors.black,);
          }, itemCount: 10)
    );
  }
}
