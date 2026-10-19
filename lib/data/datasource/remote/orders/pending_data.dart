import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData( String usersId, String ordersId) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "usersid": usersId,
      "ordersid": ordersId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
