import 'package:get/get.dart';
import 'package:get_x/mvvm%20asif%20%20taj/res/routes/route_names.dart';
import 'package:get_x/mvvm%20asif%20%20taj/view/splashScreen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => Splashscreen(),transition: Transition.fade),
  ];
}
