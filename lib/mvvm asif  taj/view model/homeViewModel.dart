import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/models/Usermodel/UserListModel.dart';
import 'package:get_x/mvvm%20asif%20%20taj/repository/home_repository/homerepository.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/colors/app%20colors.dart';

import '../data/response/status.dart';
import '../utils/utils.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxStatus = Status.LOADING.obs;
  RxInt selectedUser = 0.obs;
  final rxUserList = UserListModel().obs;
  RxString error ="".obs;
  RxBool sLoading = false.obs;
  void setrxStatus(Status status) => rxStatus.value = status;
  void setrxUserList(UserListModel userList) => rxUserList.value = userList;
  void setrxError(String error) => this.error.value = error;
  void setselectedUser(int index) => selectedUser.value = index;

  Future<void> userList() async {
    sLoading.value=true;
    _api.userList().then((value) {
      sLoading.value=false;
      setrxUserList(value);
      setrxStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      sLoading.value=false;
      setrxStatus(Status.ERROR);
      setrxError(error.toString());
      Utils.toast(error.toString(), AppColors.red);

    });
  }

  void SelectUser(int index){
    setselectedUser(index);
    Get.toNamed("/detailScreen");
  }
  void removeUser(){
    Get.back();
    rxUserList.value.data!.removeAt(selectedUser.value);
    rxUserList.refresh();
  }

}
