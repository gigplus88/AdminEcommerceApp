import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  return await Get.defaultDialog<bool>(
        title: "Alert",
        middleText: "Do You Want To Exit This App",
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(result: true);
              exit(0);
            },
            child: const Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text("No"),
          ),
        ],
      ) ??
      false;
}
