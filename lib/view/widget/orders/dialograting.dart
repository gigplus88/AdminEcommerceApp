import 'dart:ui';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rating_dialog/rating_dialog.dart';

Widget _dialog(String ordersid) {
  return RatingDialog(
    initialRating: 1.0,
    title: const Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    image: Image.asset('images/logo.png', width: 250, height: 250),
    submitButtonText: 'Submit',
    submitButtonTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      OrdersArchiveController controller = Get.find();
      print('rating: ${response.rating}, comment: ${response.comment}');
      controller.setRating(
        ordersid,
        response.rating.toString(),
        response.comment,
      );
    },
  );
}

void showDialogRating(BuildContext context, String ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => _dialog(ordersid),
  );
}
