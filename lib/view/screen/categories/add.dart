import 'package:admin/controller/categories/add_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/foundation.dart'; // للتحقق من kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(CategoriesAddController());

    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      body: GetBuilder<CategoriesAddController>(
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
                    label: "Category Name",
                    hintText: "Enter Category Name",
                    icon: Icons.category,
                    myController: controller.name,
                    valid: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),

                  CustomTextFormGlobal(
                    label: "Category Name Arabic",
                    hintText: "Enter Category Name Arabic",
                    icon: Icons.category,
                    myController: controller.nameAr,
                    valid: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
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
                      if (val == null || val.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
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
                      if (val == null || val.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            controller.chooseImage();
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text("Choose Image"),
                        ),
                      ),
                      if (controller.file != null ||
                          controller.uint8list != null) ...[
                        const SizedBox(width: 10),
                        SvgPicture.memory(
                          kIsWeb
                              ? controller.uint8list!
                              : controller.file!.readAsBytesSync(),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      controller.addCategory();
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
