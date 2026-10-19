import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  post({required String email, required String password}) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
