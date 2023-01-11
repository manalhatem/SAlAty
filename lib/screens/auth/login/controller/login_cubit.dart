
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../component/toast.dart';
import '../../../../core/local/cach_helper.dart';
import '../../../../core/local/global_config.dart';
import '../../../../core/remote/dio.dart';
import '../../../../utilities/routes.dart';
import '../models/login_model.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(InitialLoginState());

  static LoginCubit get(context)=> BlocProvider.of(context);
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  String?  email, password;

  bool visible=false;
  void changeVisible(){
    visible = !visible;
    emit(ChangeEyePassword());
  }

  Map<dynamic,dynamic>? loginResponse;
  LoginModel? loginModel;

  Future<void> login(context)async{
    emit(LoginLoadingState());
    try{
      Map<String,dynamic> headers= {
        'Content-Type':'application/json',
        'lang':'en' ,

      };
      final formDate=({
        'email':email,
        'password':password,
      });
      print(formDate);

     loginResponse=await myDio(
          url: AllAppApiConfig.baseUrl + AllAppApiConfig.LOGIN,
          methodType: 'post',
          dioBody: formDate,
          dioHeaders: headers,
          context: context);

      if(loginResponse!['status']== false){
        showToast(text: loginResponse!['message'], state: ToastStates.error);
        emit(LoginFailureState());

      }
      else{
        showToast(text: loginResponse!['message'], state: ToastStates.success);
        loginModel=LoginModel.fromJson(loginResponse!);
        saveDataToShared(loginModel!);
        print(loginModel);
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        emit(LoginSuccessState());
      }


    }
    catch(e,s){
      print(e.toString());
      print(s.toString());
    }
    emit(InitialLoginState());
    print('>>>>>>>>>>>>>> finishing Register data >>>>>>>>>');

  }

  saveDataToShared(LoginModel user) async {
    print('Start Saving data');
    CacheHelper.saveData('name', user.data!.name);
    CacheHelper.saveData('email', user.data!.email);
    CacheHelper.saveData('phone',user.data!.phone);
    CacheHelper.saveData('id', user.data!.id);
    CacheHelper.saveData('token', user.data!.token);
    CacheHelper.saveData('image', user.data!.image);
    CacheHelper.saveData('image', user.data!.points);
    CacheHelper.saveData('image', user.data!.credit);

    print('Finish Saving data');
  }

}