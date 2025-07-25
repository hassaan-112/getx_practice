import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/assets/IconAssets.dart';

import '../view model/loginViewModel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double turns = 0.0;
  Timer? _timer;
  final loginVm = Get.put(LoginViewModel());
  @override
  void initState() {
    super.initState();
    _timer =Timer.periodic(Duration(seconds: 1), (Timer r) {
      if(mounted){
      setState(() {
        turns += 1 / 4;
      });}
    });
    Timer(Duration(seconds: 4), () {
      loginVm.is_logedIn();
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              child: SvgPicture.asset(
                IconAssets.debian,
                height: Get.width * 0.4,
              ),
            ),
            Text("app_name".tr, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
