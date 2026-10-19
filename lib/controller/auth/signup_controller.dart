import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;

  late TextEditingController phone;
  late TextEditingController password;

  //List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  late SignUpData signUpData = SignUpData(Get.find<Crud>());

  postData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.post(
        usersName: username.text,
        email: email.text,
        password: password.text,
        phone: phone.text,
      );
      //print("Response is: $response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offAllNamed(
            AppRoute.verifyCodeSignUp,
            arguments: {"email": email.text},
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or Phone Number Is Already Exist",
            onCancel: () => {},
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      await postData();

      // to delete memory
      // Get.delete<SignUpControllerImp>();
    } else {
      print("Not valid Data Input");
    }
  }

  @override
  void onInit() {
    signUpData = SignUpData(Get.find<Crud>());
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
