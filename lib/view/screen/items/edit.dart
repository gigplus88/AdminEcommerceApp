import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/edit_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/customdropdownsearch.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:admin/linkApi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Item")),
      body: GetBuilder<ItemsEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Item Name",
                    hintText: "Enter Item Name",
                    icon: Icons.shop,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, "text");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Item Name Arabic",
                    hintText: "Enter Item Name Arabic",
                    icon: Icons.shop,
                    myController: controller.nameAr,
                    valid: (val) {
                      return validInput(val!, 1, 30, "text");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Description",
                    hintText: "Enter Description",
                    icon: Icons.description,
                    myController: controller.desc,
                    valid: (val) {
                      return validInput(val!, 1, 200, "text");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Description Arabic",
                    hintText: "Enter Description Arabic",
                    icon: Icons.description,
                    myController: controller.descAr,
                    valid: (val) {
                      return validInput(val!, 1, 200, "text");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Count",
                    hintText: "Enter Item Count",
                    icon: Icons.format_list_numbered,
                    myController: controller.count,
                    valid: (val) {
                      return validInput(val!, 1, 300, "number");
                    },
                    isNumber: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Price",
                    hintText: "Enter Item Price",
                    icon: Icons.price_change,
                    myController: controller.price,
                    valid: (val) {
                      return validInput(val!, 1, 100, "number");
                    },
                    isNumber: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormGlobal(
                    label: "Discount",
                    hintText: "Enter Item Discount",
                    icon: Icons.discount,
                    myController: controller.discount,
                    valid: (val) {
                      return validInput(val!, 1, 20, "number");
                    },
                    isNumber: true,
                  ),
                  const SizedBox(height: 20),

                  GetBuilder<CategoriesController>(
                    builder: (catController) {
                      final uniqueCategories = {
                        for (var cat in catController.data)
                          cat.categoriesId.toString(): cat,
                      }.values.toList();

                      String selectedCategoryName = "";
                      try {
                        if (controller.selectedCategoryId != null) {
                          var match = uniqueCategories.firstWhere(
                            (cat) =>
                                cat.categoriesId.toString() ==
                                controller.selectedCategoryId,
                          );
                          selectedCategoryName = match.categoriesName ?? "";
                        }
                      } catch (_) {
                        selectedCategoryName = "";
                      }

                      return CustomDropDownSearch<dynamic>(
                        items: uniqueCategories,
                        title: "Select Category",
                        searchHint: "Choose Category",
                        selectedText: selectedCategoryName,
                        getName: (cat) => cat.categoriesName ?? "",
                        getValue: (cat) => cat.categoriesId.toString(),
                        onSelected: (id, name) {
                          controller.selectedCategoryId = id;
                          controller.categoriesId.text = id;
                          controller.update();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  const Text(
                    "Item Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  RadioGroup<String>(
                    groupValue: controller.active,
                    onChanged: (val) {
                      controller.changeStatusActive(val);
                    },
                    child: const Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text("Active (Visible)"),
                            value: "1",
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text("Hidden (Inactive)"),
                            value: "0",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // زر اختيار الصورة ومعاينتها (مطابق لـ ItemsAdd)
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            controller.chooseImage(context);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text("Change Image"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child:
                            controller.file != null ||
                                controller.uint8list != null
                            ? Image.memory(
                                kIsWeb
                                    ? controller.uint8list!
                                    : controller.file!.readAsBytesSync(),
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                              )
                            : Image.network(
                                "${AppLink.imageCategories}/${controller.oldImageName}",
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image, size: 40),
                              ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  MaterialButton(
                    color: const Color.fromARGB(255, 153, 184, 236),
                    onPressed: () {
                      controller.editItem();
                    },
                    child: const Text("Save Changes"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
