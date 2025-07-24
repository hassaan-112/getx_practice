import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/routes/route_names.dart';
import 'package:get_x/mvvm%20asif%20%20taj/view/loginScreen.dart';
import 'package:get_x/mvvm%20asif%20%20taj/view/HomeScreen.dart';
import 'package:get_x/mvvm%20asif%20%20taj/view/splashScreen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen(),transition: Transition.fade,transitionDuration: Duration(seconds: 3)),
    GetPage(name: RouteName.loginScreen, page: () => Loginscreen(),transition: Transition.fade,transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: RouteName.homeScreen, page: () => HomeScreen(),transition: Transition.fade,transitionDuration: Duration(milliseconds: 500)),
  ];
}
