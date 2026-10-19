import 'package:admin/controller/orders/orderscreen_controller.dart';
import 'package:admin/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends GetView<OrderScreenControllerImp> {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            children: [
              ...List.generate(controller.listPage.length, (index) {
                return Expanded(
                  child: CustomButtonAppBar(
                    iconData: controller.bottomAppBar[index]["icon"],
                    textButton: controller.bottomAppBar[index]["title"],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentPage == index ? true : false,
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
