import 'package:admin/controller/items/edit_controller.dart';
import 'package:get/get.dart';

class ItemsEditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsEditController());
  }
}
