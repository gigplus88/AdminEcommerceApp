import 'package:admin/core/localization/changelocal.dart';
import 'package:admin/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("E")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose your language".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            CustomButtonLang(
              textButton: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed("/onboarding");
              },
            ),
            SizedBox(height: 10),
            CustomButtonLang(
              textButton: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed("/onboarding");
              },
            ),
          ],
        ),
      ),
    );
  }
}
