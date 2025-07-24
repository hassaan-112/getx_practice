import 'dart:convert';

import 'package:get_x/mvvm%20asif%20%20taj/data/network/network_api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/urls/urls.dart';
class LoginRepository{

  final _apiServices =NetworkApiServices();
  Future<dynamic> login(dynamic data) async {
    final response= _apiServices.postApi(data,AppUrls.loginUrl);
    return response;
  }


}
