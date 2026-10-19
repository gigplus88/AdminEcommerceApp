import 'dart:io';
import 'dart:typed_data';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  CategoriesController categoriesController =
      Get.isRegistered<CategoriesController>()
      ? Get.find<CategoriesController>()
      : Get.put(CategoriesController());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descAr;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController categoriesId;

  late String itemsId;
  late String oldImageName;

  String? selectedCategoryName;
  String? selectedCategoryId;

  File? file;
  Uint8List? uint8list;
  String? active = "1" ;

  List getCategoriesList() {
    return categoriesController.data;
  }

  chooseImage(BuildContext context) async {
    var pickedFile = await imageUploadChooser(context);

    if (pickedFile != null) {
      if (kIsWeb) {
        if (pickedFile is PlatformFile) {
          uint8list = pickedFile.bytes;
        } else if (pickedFile is XFile) {
          uint8list = await pickedFile.readAsBytes();
        }
        file = null;
      } else {
        file = pickedFile;
        uint8list = null;
      }
      update();
    }
  }

  StatusRequest statusRequest = StatusRequest.none;

  editItem() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var imageToSend = kIsWeb ? uint8list : file;

      var response = await itemsData.edit({
        "items_id": itemsId,
        "old_image": oldImageName,
        "items_name": name.text,
        "items_name_ar": nameAr.text,
        "items_desc": desc.text,
        "items_desc_ar": descAr.text,
        "items_count": count.text,
        "items_price": price.text,
        "items_discount": discount.text,
        "items_categories": categoriesId.text,
        "items_active": active,
      }, imageToSend);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          refreshData();
          Get.offNamed(AppRoute.ItemsView);
        }
      } else {
        update();
      }
    }
  }
  void changeStatusActive(String? val) {
    if (val != null) {
      active = val;
      update();
    }
  }

  refreshData() {
    if (Get.isRegistered<ItemsViewController>()) {
      ItemsViewController itemsViewController = Get.find();
      itemsViewController.getData();
    } else {
      Get.lazyPut(() => ItemsViewController());
      ItemsViewController itemsViewController = Get.find();
      itemsViewController.getData();
    }
  }

  @override
  void onInit() {
    var itemsModel = Get.arguments["itemsModel"];

    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    categoriesId = TextEditingController();

    name.text = itemsModel.itemsName!;
    nameAr.text = itemsModel.itemsNameAr!;
    desc.text = itemsModel.itemsDesc!;
    descAr.text = itemsModel.itemsDescAr!;
    count.text = itemsModel.itemsCount!;
    price.text = itemsModel.itemsPrice!;
    discount.text = itemsModel.itemsDiscount!;
    categoriesId.text = itemsModel.itemsCategories!;
active = itemsModel.itemsActive?.toString() ?? "1";


    itemsId = itemsModel.itemsId!.toString();
    oldImageName = itemsModel.itemsImage!;
    categoriesId.text = itemsModel.itemsCategories!.toString();

    // 2. تعيين الـ ID في المتغير لكي يتم مطابقة الاسم في الـ DropDown
    selectedCategoryId = itemsModel.itemsCategories!.toString();

    if (categoriesController.data.isEmpty) {
      categoriesController.getData();
    } else {
      update();
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    nameAr.dispose();
    desc.dispose();
    descAr.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    categoriesId.dispose();
    super.onClose();
  }
}
