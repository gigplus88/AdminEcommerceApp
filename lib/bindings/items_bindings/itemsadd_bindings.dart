import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/add_controller.dart';
import 'package:get/get.dart';

class ItemsAddBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsAddController());
        Get.lazyPut(() => CategoriesController());

  }
}
