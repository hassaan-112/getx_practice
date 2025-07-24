import 'package:get_x/mvvm%20asif%20%20taj/data/network/network_api_services.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/urls/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/Usermodel/userModel.dart';
class LoginRepository{

  final _apiServices =NetworkApiServices();

  Future<dynamic> login(dynamic data) async {
    final response= _apiServices.postApi(data,AppUrls.loginUrl);
    return response;
  }

  Future<bool> saveUser(dynamic response)async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    UserToken user = UserToken.fromJson(response);
    return sp.setString("user", user.accessToken.toString());
  }
  Future<UserToken> getUser()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    // String? user = sp.getString("user");
    UserToken user = UserToken(accessToken: sp.getString("user"));
    return user;
  }
  Future<bool> removeUser()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    return sp.remove("user");
  }



}
