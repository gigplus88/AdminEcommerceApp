import 'package:admin/controller/auth/verifycodesignup_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignupControllerImp());

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
      body: GetBuilder<VerifyCodeSignupControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const customTextTitleAuth(text: "Check Code"),
                  const SizedBox(height: 10),

                  customTextBodyAuth(
                    text:
                        "Please Enter the Digits Code Sent To: ${controller.email}",
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
                      //controller.goToSuccessSignUp();
                      controller.verifyCode = verificationCode;
                      controller.goToSuccessSignUp();
                      // print("code is ${controller.verifyCode}");
                      // print("email is ${controller.email}");
                    }, // end onSubmit
                  ),

                  CustomButtonAuth(
                    text: "Check",
                    onPressed: () {
                      // controller.goToSuccessSignUp();
                      //print("code is ${controller.verifyCode}");
                      //print("email is ${controller.email}");
                    },
                  ),

                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(
                      child: Text(
                        "Resend verify code",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
