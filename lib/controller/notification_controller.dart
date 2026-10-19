/* import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/notification_data.dart';

import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
/* 
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      int? userId = mySe */rvices.sharedPreferences.getInt("id");
      print("=============================== User ID: $userId");

      if (userId == null) {
        print("=============================== Error: User ID is NULL!");
        statusRequest = StatusRequest.failure;
        update();
        return;
      }

      var response = await notificationData.getData(userId.toString());
      print("=============================== Controller Response: $response");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response != null && response['status'] == "success") {
          data.clear();
          data.addAll(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      print("=============================== Exception caught: $e");
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
 */
