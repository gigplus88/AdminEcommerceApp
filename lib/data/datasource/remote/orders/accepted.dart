import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  prepareDone(String ordersId, String usersId , String orderType) async {
    var response = await crud.postData(AppLink.prepareOrders, {
      "ordersid": ordersId,
      "usersid": usersId,
      "orderType" : orderType
    });
    return response.fold((l) => l, (r) => r);
  }
}
