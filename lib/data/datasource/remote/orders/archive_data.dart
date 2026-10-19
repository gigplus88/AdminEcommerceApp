import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewArchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
