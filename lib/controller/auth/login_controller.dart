import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/foundation.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  bool isShowPassword = true;
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late StatusRequest statusRequest = StatusRequest.none;
  late LoginData loginData = LoginData(Get.find<Crud>());
  MyServices myServices = Get.find();

  postData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.post(
      email: email.text,
      password: password.text,
    );
    print("Response is: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['admin_approve'].toString() == "1") {
          print(
            "Users Approve Value is: ${response['data']['admin_approve']} and type is: ${response['data']['admin_approve'].runtimeType}",
          );
          myServices.sharedPreferences.setString(
            "id",
            response['data']['admin_id'].toString(),
          );

          myServices.sharedPreferences.setString(
            "userName",
            response['data']['admin_name'],
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['admin_email'],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['admin_phone'],
          );
          myServices.sharedPreferences.setString(
            "stepsInApplication",
            "2",
          ); // that's mean he enter to Home page directly the next time
          String adminId = myServices.sharedPreferences.getString("id")!;

          if (!kIsWeb) {
            await FirebaseMessaging.instance.subscribeToTopic("admin");
            await FirebaseMessaging.instance.subscribeToTopic(
              "admin${adminId}",
            );
          } else {
            // NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(alert: true, badge: true, sound: true);

            /*if (settings.authorizationStatus ==
            AuthorizationStatus.authorized) {
                 String? webToken = await FirebaseMessaging.instance.getToken(
                vapidKey:
                    "BDaJqJB3yDPBdlZwzrPgNuyTM4G1OBgu8mHGCkfqx2RDtYpSwSQqT8CjNBl_LVE5LfPSmOZQX1h1WrSr-BhrEjM",
              );
              print("Web FCM Token: $webToken");
              
            } else {
              print("User declined notification permission on web.");
            } */
          }

          Get.offAllNamed(AppRoute.home);
        } else {
          print(
            "admin Approve Value is: ${response['data']['admin_approve']} and type is: ${response['data']['admin_approve'].runtimeType}",
          );

          Get.toNamed(
            AppRoute.verifyCodeSignUp,
            arguments: {"email": email.text},
          );
        }
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email Or Password Is Incorrect",
          onCancel: () => {},
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      await postData();
    } else {
      print("Not valid Input ");
    }
  }

  @override
  void onInit() {
    /*FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });*/
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
