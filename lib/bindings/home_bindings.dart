import 'package:admin/controller/home_controller.dart';

import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put(OrderScreenControllerImp());
    //Get.put(OrdersPending());

    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    //Get.lazyPut(() => OrdersAcceptedController(), fenix: true);
    //Get.lazyPut(() => SettingsController(), fenix: true);
  }
}
