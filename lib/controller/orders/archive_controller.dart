import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/archive_data.dart';
import 'package:admin/data/model/ordersmodel.dart';

import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "admin";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On admin";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by admin man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getStarsCount(String rating) {
    int starsCount = 0;
    if (rating.isNotEmpty) {
      starsCount = int.parse(rating);
    }
    return starsCount;
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  setRating(String ordersId, String rating, String comment) async {
    //statusRequest = StatusRequest.loading;
    update();
    // var response = await ordersArchiveData.setRating(ordersId, rating, comment);
    //statusRequest = handlingData(/*response*/);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if ( /*response['status'] == "success"*/ 1 == 1) {
        //Get.snackbar("Rating", "Rating has been submitted successfully");
        //refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
