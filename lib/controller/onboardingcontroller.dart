import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  MyServices myServices = Get.find();

  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("stepsInApplication", "1");
      print(myServices.sharedPreferences.getBool("onBoardingPassed"));
      Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
