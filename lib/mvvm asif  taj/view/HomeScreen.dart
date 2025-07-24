import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home_appbar".tr,style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),

    );
  }
}
