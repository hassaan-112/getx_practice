import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/assets/IconAssets.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/assets/image_assets.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/colors/app%20colors.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/components/TextFormFieldCommponent.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/components/buttonComponent.dart';
import '../utils/utils.dart';
import '../view model/loginViewModel.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

final _formKey = GlobalKey<FormState>();

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(image: ImageAssets.splashScreenImage, height: 100),
          // SvgPicture.asset(IconAssets.caravan, height: 50),
          Center(child: Text("splashScreenText".tr)),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                    hintText: 'email_hint'.tr,
                    controller: loginVM.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: loginVM.emailFocusNode.value,
                    onTapedOutside: (value) {
                      loginVM.emailFocusNode.value.unfocus();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.toast("Please enter email", AppColors.red);
                        return null;
                      }
                      return null;
                    },
                    onSubmited: (value) {
                      Utils.fieldFocusChange(
                          context, loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                    hintText: 'password_hint'.tr,
                    controller: loginVM.passwordController.value,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: loginVM.passwordFocusNode.value,
                    onTapedOutside: (value){
                      loginVM.passwordFocusNode.value.unfocus();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.toast("Please enter password", AppColors.red);
                        // return "Please enter password";
                      }
                      return null;
                    },
                    onSubmited: (value) {
                      // Utils.fieldFocusChange(
                      //     context, loginVM.passwordFocusNode.value,
                      //     loginVM.emailFocusNode.value);
                    },
                  ),

                ],
              ),
            ),
          ),
          ButtonComponent(
            text: "login".tr,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Utils.toast("login Succesful", AppColors.black);
              }
            },
            color: AppColors.black,
            textColor: AppColors.white,
            isLoading: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.toast("hello", AppColors.black);
          // throw InternetExceptions('Something went wrong');
        },
      ),
    );
  }
}
