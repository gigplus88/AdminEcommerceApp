import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  late StatusRequest statusRequest = StatusRequest.none;
  late CheckEmailData checkEmailData = CheckEmailData(Get.find<Crud>());

  checkEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await checkEmailData.post(email: email.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Is Not Found",
            onCancel: () => {},
          );
          statusRequest = StatusRequest.failure;
        }
        ;
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText:
              "email not found or There is an error, please try again later ",
          onCancel: () => {},
        );
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
