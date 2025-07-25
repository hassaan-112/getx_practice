import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/repository/login_repository/loginRepository.dart';
import '../utils/utils.dart';

class LoginViewModel extends GetxController{
  final _api = LoginRepository();
  final passwordController =TextEditingController().obs;
  RxBool isLoading = false.obs;
  final emailController =TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isObscure = true.obs;




  void login() {
    isLoading.value=true;
    Map data={
      "username":emailController.value.text,
      "password":passwordController.value.text,
    };
    _api.login(data).then((value){
      isLoading.value=false;
      if(value['message']=="Invalid credentials"){
        Utils.toast(value.toString(), Colors.red);

    }
      else{
        Utils.Scankbar("login", "login success");
        emailController.value.clear();
        passwordController.value.clear();
        _api.saveUser(value).then((value){
          Utils.toast("user saved", Colors.green);
          Get.offAndToNamed("/homeScreen");

        }).onError((error,stackTrace){
          Utils.toast("error    $error", Colors.red);
        });
      }
    }).onError((error,stackTrace){
      isLoading.value=false;
      Utils.toast("error    $error", Colors.red);
    });
  }


  void is_logedIn()async {
    final user = await _api.getUser();
    if (user.accessToken != null) {
      Get.offAndToNamed('/homeScreen');
    }
    else {
      Get.offAndToNamed('/loginScreen');
    }
  }
  void removeUser()async{
    await _api.removeUser();
  }

  }

