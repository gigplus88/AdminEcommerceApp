import 'package:admin/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Resest Password".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const customTextTitleAuth(text: "Check Email"),
                    const SizedBox(height: 10),

                    const customTextBodyAuth(text: "Please Enter New Password"),
                    const SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      myController: controller.newPassword,
                      label: "New Password",
                      hintText: "Enter Your New Password",
                      icon: Icons.password_outlined,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      myController: controller.reEnteredNewPassword,
                      label: "Re Enter Pass",
                      hintText: "Re Enter Your New Password",
                      icon: Icons.password_outlined,
                    ),

                    CustomButtonAuth(
                      text: "Save",
                      onPressed: () {
                        controller.goToSuccessResetPassword();
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
