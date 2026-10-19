import 'dart:io';
import 'dart:typed_data'; // ضروري لتعريف Uint8List للبايتات على الويب
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/foundation.dart'; // للتحقق من kIsWeb
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descAr;

  // للموبايل
  File? file;
  // للويب (لتخزين البايتات وعرضها ورفعها)
  Uint8List? uint8list;

  chooseImage() async {
    var pickedFile = await fileUploadGallery(true);

    if (pickedFile != null) {
      if (kIsWeb) {
        // إذا كان التطبيق يعمل على الويب، الملف سيكون من نوع PlatformFile
        uint8list = pickedFile.bytes;
        file = null; // تفريغ متغير الموبايل لمنع التضارب
      } else {
        // إذا كان على الموبايل، الملف سيكون من نوع File
        file = pickedFile;
        uint8list = null;
      }
      update();
    }
  }

  StatusRequest statusRequest = StatusRequest.none;

  addCategory() async {
    if (file == null && uint8list == null) {
      Get.snackbar(
        "Warning",
        "Please choose a category image",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      // إرسال البيانات (تأكد أن دالة categoriesData.add تتعامل مع البايتات على الويب أو الملف حسب برمجتها)
      // ملاحظة: عادة الدوال في الـ remote data تُعدل لتقبل uint8list إذا كنا على الويب
      var imageToSend = kIsWeb ? uint8list : file;

      var response = await categoriesData.add({
        "categories_name": name.text,
        "categories_name_ar": nameAr.text,
        "categories_desc": desc.text,
        "categories_desc_ar": descAr.text,
      }, imageToSend);

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
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
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
