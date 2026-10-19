import 'package:admin/controller/auth/signup_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:admin/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// We can use lazyPut or binding to remove data from this page after i go to other page
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Sign Up".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const customTextTitleAuth(text: "Welcome Back"),
                    const SizedBox(height: 10),

                    const customTextBodyAuth(
                      text:
                          "Sign Up With Your Email And Password Or Continue With Social Media",
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "username");
                      },
                      myController: controller.username,
                      label: "UserName",
                      hintText: "Enter Your UserName",
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 12, 100, "email");
                      },
                      myController: controller.email,
                      label: "Email",
                      hintText: "Enter Your Email",
                      icon: Icons.email_outlined,
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 12, 100, "phone");
                      },
                      myController: controller.phone,
                      label: "Phone",
                      hintText: "Enter Your Phone",
                      icon: Icons.phone_outlined,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      myController: controller.password,
                      label: "Password",
                      hintText: "Enter Your Password",
                      icon: Icons.lock_outline,
                    ),
                    CustomButtonAuth(
                      text: "Sign Up",
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(height: 30),

                    CustomTextSignUp(
                      textOne: "have an account?",
                      textTwo: "Sign In",
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
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
