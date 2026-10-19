import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  post({required String email, required String password}) async {
    var response = await crud.postData(AppLink.resetpassword, {
      "users_email": email,
      "users_password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
