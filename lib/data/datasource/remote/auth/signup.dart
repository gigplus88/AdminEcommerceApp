import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  post({
    required String usersName,
    required String email,
    required String password,
    required String phone,
  }) async {
    var response = await crud.postData(AppLink.signup, {
      "users_name": usersName,
      "users_email": email,
      "users_password": password,
      "users_phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
