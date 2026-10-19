import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
