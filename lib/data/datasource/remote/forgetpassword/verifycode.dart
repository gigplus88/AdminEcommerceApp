import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  post({required String email, required String verifyCode}) async {
    var response = await crud.postData(AppLink.verifycode, {
      "users_email": email,
      "users_verifycode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
