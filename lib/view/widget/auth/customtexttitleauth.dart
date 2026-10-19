import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class customTextTitleAuth extends StatelessWidget {
  final String text;
  const customTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: TextAlign.center,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge!.copyWith(color: AppColor.black),
    );
  }
}
