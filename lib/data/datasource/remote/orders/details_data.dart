import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String orderId) async {
    var response = await crud.postData(AppLink.viewDetailsOrders, {
      "id": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
