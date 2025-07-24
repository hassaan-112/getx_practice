import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/localiation/languages.dart';


import 'mvvm asif  taj/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Locale("en","US"),
      fallbackLocale:  Locale("en","US"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),

          titleSmall: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),

        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppRoutes.appRoutes(),

      // home: HomeScreen(),
      // home: Splashscreen(),
    );
  }
}
