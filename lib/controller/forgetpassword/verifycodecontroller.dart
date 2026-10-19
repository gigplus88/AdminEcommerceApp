import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String email;
  late String verifyCode;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find<Crud>());
  late StatusRequest statusRequest = StatusRequest.none;

  checkCode() async {
    if (verifyCode.length != 5) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Please enter a valid 5-digit verification code",
        onCancel: () => {},
      );
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await verifyCodeForgetPasswordData.post(
      email: email,
      verifyCode: verifyCode,
    );
    print("Response is: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.resetPassword, arguments: {"email": email});
      }
      ;
    } else {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Verification Code Is Already Used Or Invalid",
        onCancel: () => {},
      );
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Map) {
      email = Get.arguments['email'];
    } else {
      email = '';
    }
    super.onInit();
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }
}
