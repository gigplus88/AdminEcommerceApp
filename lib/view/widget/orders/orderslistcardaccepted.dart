import 'package:admin/controller/orders/accepted_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart'
    show GetNavigation;
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListAccepted extends GetView<OrdersAcceptedController> {
  final OrdersModel listdata;
  const CardOrdersListAccepted({Key? key, required this.listdata})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Text(listdata.ordersDatetime!)
                Text(
                  Jiffy.parse(
                    listdata.ordersDatetime!,
                    pattern: "yyyy-MM-dd",
                  ).fromNow(),
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              "Order Type : ${controller.printOrderType(listdata.ordersType!)}",
            ),
            Text("Order Price : ${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
            Text(
              "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} ",
            ),
            Text(
              "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} ",
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotalprice} \$ ",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoute.ordersDetails,
                      arguments: {"ordersmodel": listdata},
                    );
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondaryColor,
                  child: const Text("Details"),
                ),
               const SizedBox(width: 10),

                if (listdata.ordersStatus == "1")
                  MaterialButton(
                    onPressed: () {
                      controller.donePrepare(
                        listdata.ordersId!,
                        listdata.ordersUsersid!,
                        listdata.ordersType!,
                      );
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondaryColor,
                    child: const Text("Done"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
