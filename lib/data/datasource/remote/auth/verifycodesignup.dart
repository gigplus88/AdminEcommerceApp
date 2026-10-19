import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);

  post({required String email, required String verifyCode}) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "users_email": email,
      "users_verifycode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
