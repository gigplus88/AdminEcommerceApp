import 'package:admin/controller/onboardingcontroller.dart';
import 'package:admin/view/widget/onboarding/custombutton.dart';
import 'package:admin/view/widget/onboarding/customslider.dart';
import 'package:admin/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    //OnBoarding item = OnBoarding();
    // it listen to OnBoardingControllerImp
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 3, child: CustomSliderOnBoarding()),
          Expanded(
            flex: 1,
            child: const Column(
              children: [
                CustomDotControllerOnBoarding(),
                Spacer(flex: 2),
                CustomButtonOnBoarding(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
