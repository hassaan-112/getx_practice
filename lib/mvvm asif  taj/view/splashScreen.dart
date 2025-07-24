import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/assets/IconAssets.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {
  double turns =0.0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer r) {
      setState(() {
        turns += 1 / 4;
      });
    });
    Timer(Duration(seconds: 4), (){Get.offAndToNamed('/loginScreen');});
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRotation(turns: turns, duration: Duration(seconds: 1),
            child:SvgPicture.asset(IconAssets.debian,height: Get.width*0.4,)
          ),
          Text("app_name".tr,style:Theme.of(context).textTheme.titleLarge)

        ],
      ),
    ),
    );

  }
}
