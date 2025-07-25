import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_x/mvvm%20asif%20%20taj/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
class NetworkApiServices extends BaseApiServices{
  var ResponseJson;
  @override
  Future getApi(String url) async {
    try{
      final responce =await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      ResponseJson = ReturnResponse(responce);
    }
    on SocketException {
      throw InternetExceptions("");
    }
    catch(e){
      throw OtherExceptions('Something went wrong $e');
    }
    return ResponseJson;

  }




  @override
  Future postApi(var data, String url) async{

    print("network api");
    try{
      final responce =await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      ResponseJson = ReturnResponse(responce);
    }
    on SocketException {
      throw InternetExceptions('No Internet');
    }
    catch(e){
      throw OtherExceptions('Something went wrong $e');
    }
    return ResponseJson;
  }


  dynamic ReturnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        // throw BadRequestException("bad request${response.body}");

        default:
          throw OtherExceptions("Something went wrong ${response.statusCode}");
    }
  }
}