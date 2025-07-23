import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/colors/app%20colors.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/localiation/languages.dart';
import '../utils/utils.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("splashScreenText".tr),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Utils.toast("hello",AppColors.black);
        // throw InternetExceptions('Something went wrong');
      },)
    );
  }
}
