import 'package:admin/controller/categories/edit_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:admin/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(CategoriesEditController());

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Category")),
      body: GetBuilder<CategoriesEditController>(
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
                      return null;
                    },
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),

                  // حقل الوصف (عربي)
                  CustomTextFormGlobal(
                    label: "Description Arabic",
                    hintText: "Enter Description Arabic",
                    icon: Icons.description,
                    myController: controller.descAr,
                    valid: (val) {
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
                          child: const Text("Change Category Image"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      controller.file != null
                          ? Image.file(
                              controller.file!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : //SvgPicture.network(
                            //"${AppLink.serverLinkNgrok}/${'upload/categories'}/${controller.oldImageName}",
                            SvgPicture.network(
                              "${AppLink.imageCategories}/${controller.oldImageName}",
                              width: 60,

                              height: 60,
                              fit: BoxFit.cover,
                              placeholderBuilder: (context) => const SizedBox(
                                width: 60,
                                height: 60,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      controller.editCategory();
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
