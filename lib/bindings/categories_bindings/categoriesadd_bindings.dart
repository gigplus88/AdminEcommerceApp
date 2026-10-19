import 'package:admin/controller/categories/add_controller.dart';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:get/get.dart';

class CategoriesAddBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesAddController());
  }
}
