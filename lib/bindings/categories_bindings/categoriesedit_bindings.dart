import 'package:admin/controller/categories/edit_controller.dart';
import 'package:get/get.dart';

class CategoriesEditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesEditController());
  }
}
