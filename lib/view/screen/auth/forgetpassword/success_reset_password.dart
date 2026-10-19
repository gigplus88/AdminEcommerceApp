import 'package:admin/controller/auth/successresetpassword_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Success".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 250,
                color: AppColor.primaryColor,
              ),
            ),
            Text("Reset Password successfully".tr),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 150),
              width: double.infinity,
              child: CustomButtonAuth(
                text: "Go To Login",
                onPressed: () {
                  controller.goToLoginPage();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
