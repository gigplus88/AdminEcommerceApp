import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  late ItemsData itemsData = ItemsData(Get.find<Crud>());
  List<ItemsModel> data = [];
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
    var response = await itemsData.get();
    print("Response is: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItem(String id, String imageName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await itemsData.delete({
      "items_id": id,
      "image_name": imageName,
    });

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.itemsId.toString() == id);
        Get.snackbar(
          "Success",
          "Item deleted successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Failed to delete item",
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

  goToEditPage(ItemsModel itemsModel) {
    Get.toNamed(
      AppRoute.ItemsEdit,
      arguments: {"itemsModel": itemsModel},
    );
  }
}