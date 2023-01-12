
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/toast.dart';
import '../../../core/local/global_config.dart';
import '../../../core/remote/dio.dart';
import '../model/home_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit get(context)=> BlocProvider.of(context);

  Map<dynamic,dynamic>? homeResponse;
  HomeModel? homeModel;

  Future<void> getHome(context)async{
    emit(LoadingHomeState());
    try{
      Map<String,dynamic> headers={
        'Content-Type':'application/json',
        'lang':'en' ,
      };
      homeResponse=await myDio(context: context,
      dioBody: null,
      dioHeaders: headers,
      methodType: 'get',
        url: AllAppApiConfig.baseUrl + AllAppApiConfig.HOME,
      );

      if(homeResponse!['status']==false){
        showToast(text: homeResponse!['message'],state: ToastStates.error);
        emit(FailureHomeState());
      }
      else{
        showToast(text: homeResponse!['message'], state: ToastStates.success);
        homeModel=HomeModel.fromJson(homeResponse!);
        print(homeModel);
        emit(SuccessHomeState());
      }



    }catch(e,s){
      print(e.toString());
      print(s.toString());
    }


  }

  final CarouselController controller = CarouselController();
  int currentIndex=0;
void changeIndex(index){
  currentIndex=index;
  emit(CarouselHomeState());
}




}