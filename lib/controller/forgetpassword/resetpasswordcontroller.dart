import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  checkSamePassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  late TextEditingController newPassword;
  late TextEditingController reEnteredNewPassword;

  late StatusRequest statusRequest = StatusRequest.none;
  late ResetPasswordData resetPasswordData = ResetPasswordData(
    Get.find<Crud>(),
  );

  @override
  checkSamePassword() {
    if (newPassword.text == reEnteredNewPassword.text) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Map) {
      email = TextEditingController(text: Get.arguments['email'] ?? '');
    } else {
      email = TextEditingController();
    }
    newPassword = TextEditingController();
    reEnteredNewPassword = TextEditingController();
    super.onInit();
  }

  @override
  goToSuccessResetPassword() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      if (!checkSamePassword()) {
        return Get.defaultDialog(
          title: "Warning",
          middleText: "Passwords do not match",
          onCancel: () => {},
        );
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.post(
        email: email.text,
        password: newPassword.text,
      );
      print("Response is: $response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          print("Response is: $response");
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email  incorrect Or Password is the Same of the old",
            onCancel: () => {},
          );
        }
      }
      update();
    } else {
      print("Not valid");
    }
  }

  @override
  void dispose() {
    newPassword.dispose();
    reEnteredNewPassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() {}
}
