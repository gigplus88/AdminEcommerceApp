import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class MyMiddleware extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("stepsInApplication") == "2") {
      return const RouteSettings(name: AppRoute.home);
    }
    //print(myServices.sharedPreferences.getBool("onBoardingPassed"));
    if (myServices.sharedPreferences.getString("stepsInApplication") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
