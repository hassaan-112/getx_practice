import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US":{
      "splashScreenText":"This data is coming from localization folder"
    },
    "ur_PK":{
      "splashScreenText":"یہ ڈیٹا لوکلائزیشن فولڈر سے آ رہا ہے۔"
    }
  };
}