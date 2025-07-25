import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/models/Usermodel/UserListModel.dart';
import 'package:get_x/mvvm%20asif%20%20taj/repository/home_repository/homerepository.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/colors/app%20colors.dart';

import '../data/response/status.dart';
import '../utils/utils.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxStatus = Status.LOADING.obs;
  final rxUserList = UserListModel().obs;
  RxString error ="".obs;

  void setrxStatus(Status status) => rxStatus.value = status;
  void setrxUserList(UserListModel userList) => rxUserList.value = userList;
  void setrxError(String error) => this.error.value = error;

  Future<void> userList() async {
    _api.userList().then((value) {
      setrxUserList(value);
      setrxStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setrxStatus(Status.ERROR);
      setrxError(error.toString());
      Utils.toast(error.toString(), AppColors.red);

    });
  }
}
