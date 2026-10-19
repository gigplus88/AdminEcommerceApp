import 'package:admin/controller/auth/login_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/alertexitapp.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/view/widget/auth/textsignup.dart';
import 'package:admin/view/widget/auth/CustomButtonAuth.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtextformauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:admin/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        final bool? exitApp = await alertExitApp();

        if (exitApp == true) {
          if (kIsWeb) {
            debugPrint("Exit app is restricted on web browsers");
          } else {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Sign In".tr,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const logoAuth(),
                      const SizedBox(height: 20),
                      const customTextTitleAuth(text: "Welcome Back"),
                      const SizedBox(height: 10),
                      const customTextBodyAuth(
                        text:
                            "Sign In With Your Email And Password Or Continue With Social Media",
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
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isPassword: controller.isShowPassword,
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          myController: controller.password,
                          label: "Password",
                          hintText: "Enter Your Password",
                          icon: Icons.lock_outline,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            controller.goForgetPassword();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomButtonAuth(
                        text: "Sign In",
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextSignUp(
                        textOne: "Don't have an account ?",
                        textTwo: "Sign Up",
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
