import 'package:flutter/material.dart';

import 'style/colors.dart';
class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key,this.hintName,this.save,this.val,this.prefix,
   required this.secure,this.type,this.suffix}) : super(key: key);

  String? hintName;
  void Function(String?)? save;
  String? Function(String?)? val;
  IconData? prefix;
  TextInputType? type;
  Widget? suffix;
  bool secure;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: type,
      cursorColor: AppColor.mainColor,
      onSaved: save,
      validator: (val){
        if(val!.isEmpty){
          return ' you should enter $hintName';
        }
      },
      obscureText: secure,
      decoration: InputDecoration(
        hintText: hintName,
        hintStyle: TextStyle(color: AppColor.mainColor,fontFamily: 'Janna LT' ),
        prefixIcon: Icon(prefix,color: AppColor.mainColor,),
        suffixIcon: suffix,
        border:  const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.mainColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
