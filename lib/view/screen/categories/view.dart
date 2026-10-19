import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: PopScope(
            canPop: true,
            onPopInvokedWithResult: (bool didPop, Object? result) {
              if (didPop) {
                return;
              }
              controller.myBack();
            },

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              "${AppImageAsset.rootImage}/categories/${controller.data[index].categoriesImage}",
                              fit: BoxFit.contain,
                              width: 80,
                              height: 80,
                              errorBuilder: (context, error, stackTrace) {
                                debugPrint("Image error: $error");
                                debugPrint(
                                  "${AppImageAsset.rootImage}/categories/${controller.data[index].categoriesImage}",
                                );
                                return const Icon(
                                  Icons.broken_image,
                                  size: 40,
                                  color: Colors.red,
                                );
                              },
                            ),
                            /*// "https://dcdc-2c0e-6042-44-fec0-75b5-e421-7825-d9a7.ngrok-free.app/ecommerce/upload/categories/laptop.png",
                              "${AppLink.imageLocalCategories}/${controller.data[index].categoriesImage}",
                              fit: BoxFit.contain,
                               */
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(controller.data[index].categoriesName!),
                            subtitle: Text(
                              controller.data[index].categoriesDatetime ?? "",
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    controller.goToEditPage(
                                      controller.data[index],
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Warning",
                                      middleText:
                                          "Are you sure you want to delete this category?",
                                      textConfirm: "Confirm",
                                      textCancel: "Cancel",
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        controller.deleteCategory(
                                          controller.data[index].categoriesId!
                                              .toString(),
                                          controller
                                              .data[index]
                                              .categoriesImage!,
                                        );
                                        Get.back();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
