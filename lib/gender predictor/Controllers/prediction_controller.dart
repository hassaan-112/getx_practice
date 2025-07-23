import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/gender%20predictor/json%20to%20dart/json_to_dart.dart';
import 'package:http/http.dart';
class PredictionController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  RxBool is_loading = false.obs;
  Rx<NameClass> data=NameClass().obs;
  Future<void> getPrediction() async{
    is_loading.value = true;
    try{
      var response = await get(Uri.parse("https://api.genderize.io?name=${nameController.text}"));
      if(response.statusCode==200){
      NameClass data = NameClass.fromJson(JsonDecoder().convert(response.body));
      is_loading.value = false;
      this.data.value = data;
      }
    }
    catch(e){
      print(e);
      is_loading.value = false;
      Get.snackbar("Error", "Something went wrong",snackPosition: SnackPosition.BOTTOM);
    }
    is_loading.value = false;
  }

}