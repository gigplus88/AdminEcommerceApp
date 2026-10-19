import 'package:admin/controller/onboardingcontroller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      margin: EdgeInsets.only(bottom: 50),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        onPressed: () {
          controller.next();
        },
        child: Text("Continue"),
      ),
    );
  }
}
