import 'package:admin/controller/items/view_controller.dart';
import 'package:get/get.dart';

class ItemsViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsViewController());
  }
}
