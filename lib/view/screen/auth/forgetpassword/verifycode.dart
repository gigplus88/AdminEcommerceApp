import 'package:admin/controller/forgetpassword/verifycodecontroller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class verifyCode extends StatelessWidget {
  const verifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Verification Code".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const customTextTitleAuth(text: "Check Code"),
            const SizedBox(height: 10),

            const customTextBodyAuth(
              text: "Please Enter the Digits Code Sent To",
            ),
            const SizedBox(height: 10),

            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.email = Get.arguments['email'] ?? '';
                controller.verifyCode = verificationCode;
                controller.checkCode();
              }, // end onSubmit
            ),

            CustomButtonAuth(text: "Check", onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
