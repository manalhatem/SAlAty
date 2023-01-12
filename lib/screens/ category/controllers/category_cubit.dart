import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salaty/component/toast.dart';

import '../../../core/local/global_config.dart';
import '../../../core/remote/dio.dart';
import '../models/category_model.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit(): super(InitialCategoryState());

  static CategoryCubit get(context)=>BlocProvider.of(context);

  Map<dynamic, dynamic>? categoryResponse;
 CategoryModel?  categoryModel;

 Future<void> getCategory(context)async{
   emit(LoadingCategoryState());
   try{
     Map<String,dynamic> headers={
       'Content-Type':'application/json',
       'lang':'en' ,
     };
     categoryResponse= await myDio(url: AllAppApiConfig.baseUrl + AllAppApiConfig.Get_CATEGORY,
         methodType: 'get',
         dioBody: null,
         dioHeaders: headers,
         context: context);
     if(categoryResponse!['status']==false){
       showToast(text: categoryResponse!['message'], state: ToastStates.error);
       emit(FailureCategoryState());
     }
     else{
       showToast(text: categoryResponse!['message'], state: ToastStates.success);
       categoryModel=CategoryModel.fromJson(categoryResponse!);
       print(categoryModel);
       emit(SuccessCategoryState());
     }


   }
   catch(e,s){
     print(e.toString());
     print(s.toString());
   }

 }

}