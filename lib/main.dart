import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/home_screen.dart';
import 'package:get_x/mvvm%20asif%20%20taj/view/splashScreen.dart';
import 'package:get_x/todo%20app/screens/HomeScreen.dart';

import 'mvvm asif  taj/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppRoutes.appRoutes(),

      // home: HomeScreen(),
      // home: Splashscreen(),
    );
  }
}
