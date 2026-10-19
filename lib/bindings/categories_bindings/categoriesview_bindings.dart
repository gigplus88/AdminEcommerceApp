import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:get/get.dart';

class CategoriesViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController());
  }
}
