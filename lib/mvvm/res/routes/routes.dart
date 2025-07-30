import 'package:get/get.dart';
import 'package:get_x/mvvm/res/routes/route_names.dart';
import 'package:get_x/mvvm/view/DetailScreen.dart';
import 'package:get_x/mvvm/view/loginScreen.dart';
import 'package:get_x/mvvm/view/HomeScreen.dart';
import 'package:get_x/mvvm/view/splashScreen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen(),transition: Transition.fade,transitionDuration: Duration(seconds: 3)),
    GetPage(name: RouteName.loginScreen, page: () => Loginscreen(),transition: Transition.fade,transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: RouteName.homeScreen, page: () => HomeScreen(),transition: Transition.fade,transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: RouteName.detailScreen, page: () => UserDetail() ,transition: Transition.fade,transitionDuration: Duration(milliseconds: 500)),
  ];
}
