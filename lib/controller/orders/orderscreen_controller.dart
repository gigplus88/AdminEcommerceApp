import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentPage = 0;

  List<Map<String, dynamic>> bottomAppBar = [
    {"title": "Pending", "icon": Icons.pending},
    {"title": "Accepted", "icon": Icons.accessibility},
    {"title": "Archive", "icon": Icons.archive},
  ];
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  exitApp() {
    SystemNavigator.pop();
  }
}
