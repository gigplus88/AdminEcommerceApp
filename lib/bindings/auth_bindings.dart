import 'package:admin/controller/auth/login_controller.dart';
import 'package:admin/controller/auth/signup_controller.dart';
import 'package:admin/controller/auth/verifycodesignup_controller.dart';
import 'package:admin/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:admin/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:admin/controller/forgetpassword/verifycodecontroller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeSignupControllerImp(), fenix: true);
  }
}
