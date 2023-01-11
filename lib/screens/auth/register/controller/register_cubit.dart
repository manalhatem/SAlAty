import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salaty/component/toast.dart';
import 'package:salaty/core/remote/dio.dart';
import 'package:salaty/utilities/routes.dart';
import '../../../../core/local/cach_helper.dart';
import '../../../../core/local/global_config.dart';
import '../models/register_model.dart';
import 'register_states.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(InitialRegisterState());

  static RegisterCubit get(context)=> BlocProvider.of(context);
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  String? name, email, phone, password;

  bool visible=false;
  void changeVisible(){
    visible = !visible;
    emit(ChangeEyePassword());
  }

  Map<dynamic,dynamic>? registerResponse;
  RegisterModel? registerModel;

  Future<void> register(context)async{
    emit(RegisterLoadingState());
    try{
      Map<String,dynamic> headers= {
        'Content-Type':'application/json',
        'lang':'en' ,

      };
      final formDate=({
        'email':email,
        'password':password,
        'name':name,
        'phone':phone
      });
      print(formDate);

      registerResponse=await myDio(
          url: AllAppApiConfig.baseUrl + AllAppApiConfig.REGISTER,
          methodType: 'post',
          dioBody: formDate,
          dioHeaders: headers,
          context: context);

      if(registerResponse!['status']== false){
        showToast(text: registerResponse!['message'], state: ToastStates.error);
        emit(RegisterFailureState());

      }
      else{
        showToast(text: registerResponse!['message'], state: ToastStates.success);
        registerModel=RegisterModel.fromJson(registerResponse!);
        saveDataToShared(registerModel!);
        print(registerModel);
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        emit(RegisterSuccessState());
      }


    }
    catch(e,s){
      print(e.toString());
      print(s.toString());
    }
    emit(InitialRegisterState());
    print('>>>>>>>>>>>>>> finishing Register data >>>>>>>>>');

  }

  saveDataToShared(RegisterModel user) async {
    print('Start Saving data');
    CacheHelper.saveData('name', user.data!.name);
    CacheHelper.saveData('email', user.data!.email);
    CacheHelper.saveData('phone',user.data!.phone);
    CacheHelper.saveData('id', user.data!.id);
    CacheHelper.saveData('token', user.data!.token);
    CacheHelper.saveData('image', user.data!.image);
    print('Finish Saving data');
  }



}