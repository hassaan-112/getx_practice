import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counterController.dart';
class SliderW extends StatelessWidget {
  const SliderW({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());
    return Obx(()=> Slider(value: sliderController.slider.value, onChanged: (value){
      sliderController.changeSlider(value);
    }),
    );
  }
}


