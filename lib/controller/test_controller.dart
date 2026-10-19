import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/test_data.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestController extends GetxController {
  late TestData testData;
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    super.onInit();
    testData = TestData(Get.find<Crud>());
    getData();
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData();
    print("Response is: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
