import 'package:get/get_state_manager/get_state_manager.dart';

abstract class CustomTextFormAuthController extends GetxController {
  bool? isPassword;
  canSeePassword();
}

class CustomTextFormAuthControllerImp extends CustomTextFormAuthController {
  @override
  canSeePassword() {
    isPassword != isPassword;
  }

  @override
  void onInit() {
    super.onInit();
  }


}
