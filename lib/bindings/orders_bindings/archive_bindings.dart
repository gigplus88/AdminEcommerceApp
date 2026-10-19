import 'package:admin/controller/orders/archive_controller.dart';
import 'package:get/get.dart';

class ArchiveBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersArchiveController());
  }
}
