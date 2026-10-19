import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/customdropdownsearch.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Item")),
      body: GetBuilder<ItemsAddController>(
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
                      return validInput(val!, 1, 30, "text");
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
                      return validInput(val!, 1, 30, "text");
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
                      return validInput(val!, 1, 20, "number");
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
                      return validInput(val!, 1, 20, "number");
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
                    init: CategoriesController(),
                    builder: (catController) {
                      // 1. تصفية البيانات لإزالة التكرار (مثل الكود الأصلي لديك)
                      final uniqueCategories = {
                        for (var cat in catController.data)
                          cat.categoriesId.toString(): cat,
                      }.values.toList();

                      // 2. البحث عن اسم الفئة المختارة حالياً لعرضه في الحقل
                      String selectedCategoryName = "";
                      if (controller.selectedCategoryId != null) {
                        final selectedCat = uniqueCategories.firstWhere(
                          (cat) =>
                              cat.categoriesId.toString() ==
                              controller.selectedCategoryId,
                          orElse: () => null as dynamic, // أو التعامل معها بحذر
                        );
                        // إذا وجدنا الفئة المطابقة للـ ID نأخذ اسمها، وإلا نتركها فارغة
                        // (تأكد من نوع المودل الخاص بك، أو استخدم try-catch للسلامة)
                      }

                      // الطريقة الأكثر أماناً لجلب الاسم المعروض حالياً بناءً على الـ ID:
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
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            // controller.chooseImage();
                            controller.chooseImage(context);
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text("Choose Image"),
                        ),
                      ),
                      if (controller.file != null ||
                          controller.uint8list != null) ...[
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 2,
                          child: Image.memory(
                            kIsWeb
                                ? controller.uint8list!
                                : controller.file!.readAsBytesSync(),
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 30),

                  MaterialButton(
                    color: const Color.fromARGB(255, 153, 184, 236),
                    onPressed: () {
                      controller.addItem();
                    },
                    child: const Text("Add"),
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
