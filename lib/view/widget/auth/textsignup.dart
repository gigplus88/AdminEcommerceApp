import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomTextSignUp extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap;

  const CustomTextSignUp({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne.tr),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo.tr,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
