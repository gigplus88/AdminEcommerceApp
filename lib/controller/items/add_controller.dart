import 'dart:io';
import 'dart:typed_data';
import 'package:admin/controller/categories/view_controller.dart'; // استيراد كنترول الفئات
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ItemsAddController extends GetxController {
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

  String? selectedCategoryName;
  String? selectedCategoryId;

  File? file;
  Uint8List? uint8list;

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

  addItem() async {
    if (file == null && uint8list == null) {
      Get.snackbar(
        "Warning",
        "Please choose an item image",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var imageToSend = kIsWeb ? uint8list : file;

      var response = await itemsData.add({
        "items_name": name.text,
        "items_name_ar": nameAr.text,
        "items_desc": desc.text,
        "items_desc_ar": descAr.text,
        "items_count": count.text,
        "items_price": price.text,
        "items_discount": discount.text,
        "items_categories": categoriesId.text,
        "dateNow": DateTime.now().toString(),
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
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    categoriesId = TextEditingController();

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

  /*
 void showGenericDropDown<T>({
  required BuildContext context,
  required List<T> items,
  required String Function(T item) getName,
  required String Function(T item) getValue,
  required Function(String id, String name) onSelected,
  String title = "Choose Option",
  String searchHint = "Search...",
}) {
  List<SelectedListItem<String>> dropDownList = [];

  final uniqueItems = {
    for (var item in items) getValue(item): item,
  }.values.toList();

  for (var item in uniqueItems) {
    dropDownList.add(
      SelectedListItem<String>(
        name: getName(item),
        value: getValue(item),
      ),
    );
  }

  // 2. عرض الـ DropDown
  DropDownState<String>(
    dropDown: DropDown<String>(
      isDismissible: true,
      bottomSheetTitle: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      submitButtonText: "Done",
      clearButtonText: "Clear",
      searchHintText: searchHint,
      data: dropDownList,
      onSelected: (selectedItems) {
        if (selectedItems.isNotEmpty) {
          SelectedListItem<String> selected = selectedItems.first;
          onSelected(selected.value ?? "", selected.name);
        }
      },
    ),
  ).showModal(context);
}*/
}
