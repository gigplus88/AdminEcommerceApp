import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoriesController extends GetxController {
  late CategoriesData categoriesData = CategoriesData(Get.find<Crud>());
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("Response is: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imageName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoriesData.delete({
      "categories_id": id,
      "image_name": imageName,
    });

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.categoriesId.toString() == id);
        Get.snackbar(
          "Success",
          "Category deleted successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Failed to delete category",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    update();
  }

  myBack() {
    Get.offAllNamed(AppRoute.home);

    return Future.value(false);
  }

  goToEditPage(CategoriesModel categoriesModel) {
    Get.toNamed(
      AppRoute.categoriesEdit,
      arguments: {"categoriesModel": categoriesModel},
    );
  }
}
