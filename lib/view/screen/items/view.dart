import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkApi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.ItemsAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewController>(
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
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.imageCategories}/${controller.data[index].itemsImage}",
                              fit: BoxFit.contain,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              controller.data[index].itemsName ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Container(
                              alignment: AlignmentGeometry.topStart,
                              margin: const EdgeInsets.only(top: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Price: ${controller.data[index].itemsPrice} - Qty: ${controller.data[index].itemsCount}",
                                  ),

                                  Text(
                                    "Category: ${controller.data[index].categoriesName} ",
                                  ),
                                ],
                              ),
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
                                          "Are you sure you want to delete this item?",
                                      textConfirm: "Confirm",
                                      textCancel: "Cancel",
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        controller.deleteItem(
                                          controller.data[index].itemsId!,
                                          controller.data[index].itemsImage!,
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
