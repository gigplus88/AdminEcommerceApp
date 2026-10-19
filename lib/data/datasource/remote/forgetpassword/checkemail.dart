import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  post({required String email}) async {
    var response = await crud.postData(AppLink.checkemail, {
      "users_email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
