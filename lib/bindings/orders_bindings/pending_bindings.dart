import 'package:admin/controller/orders/pending_controller.dart';
import 'package:get/get.dart';

class PendingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersPendingController());
  }
}
