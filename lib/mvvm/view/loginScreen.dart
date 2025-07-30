import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm/res/colors/app%20colors.dart';
import 'package:get_x/mvvm/res/components/TextFormFieldCommponent.dart';
import 'package:get_x/mvvm/res/components/buttonComponent.dart';

import '../utils/utils.dart';
import '../view model/loginViewModel.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}
final _formKey = GlobalKey<FormState>();
class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(title: Text("login".tr,style: Theme.of(context).textTheme.titleLarge), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormFieldComponent(
                    hintText: "email_hint".tr,
                    controller: loginVM.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value){
                      if(value!.isEmpty){
                        return "email_error".tr;
                      }
                      return null;
                    },
                    onSubmited: (value){
                      Utils.fieldFocusChange(context,loginVM.emailFocusNode.value,loginVM.passwordFocusNode.value);
                    },
                    onTapedOutside: (val){
                      loginVM.emailFocusNode.value.unfocus();
                    },
                  ),
                  SizedBox(height: Get.height*0.01,),
                  TextFormFieldComponent(
                    hintText: "password_hint".tr,
                    controller: loginVM.passwordController.value,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: loginVM.passwordFocusNode.value,
                    validator: (value){
                      if(value!.isEmpty){
                        return "password_error".tr;
                      }
                      return null;
                    },
                    onSubmited: (value){
                      // Utils.fieldFocusChange(context,loginVM.emailFocusNode.value,loginVM.passwordFocusNode.value);
                      loginVM.passwordFocusNode.value.unfocus();

                    },
                    onTapedOutside: (val){
                      loginVM.passwordFocusNode.value.unfocus();
                    },
                  ),
                ],
              ),
            ),

          ),
          SizedBox(height: Get.height*0.01,),
          Obx(()=>ButtonComponent(isLoading: loginVM.isLoading.value,color: AppColors.black,textColor: AppColors.white,text: "login".tr, onPressed: (){
              if(_formKey.currentState!.validate()){
                loginVM.login();
              }
            }),
          ),
        ],
      ),
    );
  }
}
