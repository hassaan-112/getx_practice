import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US":{
      "splashScreenText":"This data is coming from localization folder",
      "login":"Login",
      "email_hint":"Email",
      "email_error":"Enter valid email",
      "password_hint":"Password",
      "password_error":"Enter valid password",
      "app_name":"App Name",
      "home_appbar":"Home Screen"
    },
    "ur_PK":{
      "splashScreenText":"یہ ڈیٹا لوکلائزیشن فولڈر سے آ رہا ہے۔"
    }
  };
}