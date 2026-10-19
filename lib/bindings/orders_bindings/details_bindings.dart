import 'package:admin/controller/orders/details_controller.dart';
import 'package:get/get.dart';

class DetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersDetailsController() , fenix: true);
  }
}
