import 'dart:io';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descAr;

  late String categoriesId;
  late String oldImageName;

  File? file;
  chooseImage() async {
    file = await fileUploadGallery(true);
    //print(file);
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  editCategory() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await categoriesData.edit({
        "categories_id": categoriesId,
        "old_image": oldImageName,
        "categories_name": name.text,
        "categories_name_ar": nameAr.text,
        "categories_desc": desc.text,
        "categories_desc_ar": descAr.text,
      }, file);
      print(response);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          refreshData();
          Get.offNamed(AppRoute.categoriesView);
        }
      } else {
        update();
      }
    }
  }

  refreshData() {
    if (Get.isRegistered<CategoriesController>()) {
      CategoriesController categoriesController = Get.find();
      categoriesController.getData();
    } else {
      CategoriesController categoriesController = Get.put(
        CategoriesController(),
      );
      categoriesController.getData();
    }
  }

  @override
  void onInit() {
    var categoryModel = Get.arguments["categoriesModel"];

    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();

    name.text = categoryModel.categoriesName!;
    nameAr.text = categoryModel.categoriesNameAr!;
    desc.text = categoryModel.categoriesDesc!;
    descAr.text = categoryModel.categoriesDescAr!;
    categoriesId = categoryModel.categoriesId!.toString();
    oldImageName = categoryModel.categoriesImage!;

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    nameAr.dispose();
    desc.dispose();
    descAr.dispose();
    super.onClose();
  }
}
