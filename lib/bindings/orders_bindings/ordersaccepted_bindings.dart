import 'package:admin/controller/orders/accepted_controller.dart';
import 'package:get/get.dart';

class OrderAcceptedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersAcceptedController());
  }
}
