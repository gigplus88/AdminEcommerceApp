import 'package:admin/core/constant/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLoginPage();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  goToLoginPage() {
    Get.offAllNamed(AppRoute.login);
  }
}
