import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view model/loginViewModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text("home_appbar".tr,style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            loginVM.removeUser();
            Get.offAndToNamed("/loginScreen");
          },icon: Icon(Icons.logout_outlined),),
          SizedBox(width: 10,)],
      ),

    );
  }
}