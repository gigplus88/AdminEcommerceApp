import 'package:admin/controller/orders/accepted_controller.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/controller/orders/orderscreen_controller.dart';
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:get/get.dart';

class OrderScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderScreenControllerImp());

    Get.lazyPut(() => OrdersAcceptedController(), fenix: true);
    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => OrdersArchiveController(), fenix: true);
  }
}
