import 'package:get_x/mvvm%20asif%20%20taj/data/response/status.dart';

import '../../data/network/network_api_services.dart';
import '../../models/Usermodel/UserListModel.dart';
import '../../res/urls/urls.dart';

class HomeRepository {

  final _apiServices = NetworkApiServices();


  Future<UserListModel> userList() async {
    final response=await _apiServices.getApi(AppUrls.UserListUrl);
    return UserListModel.fromJson(response);
  }


}