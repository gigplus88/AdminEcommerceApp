import 'package:admin/controller/orders/orderscreen_controller.dart';
import 'package:admin/view/widget/home/custombuttonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(HomeScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:const CustomBottomAppBarHome(),
        appBar: AppBar(title:const Text("order")),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
