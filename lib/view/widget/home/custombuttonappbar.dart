import 'package:admin/controller/orders/orderscreen_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomButtonAppBar extends GetView<OrderScreenControllerImp> {
  final IconData iconData;
  final String textButton;
  final void Function() onPressed;
  final Color? colorItemsSelected;
  final bool active;
  const CustomButtonAppBar({
    super.key,
    required this.iconData,
    required this.textButton,
    required this.onPressed,
    this.colorItemsSelected,
    required this.active,
  });

  //return GetBuilder<HomeScreenControllerImp>
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active
                ? AppColor.primaryColor
                : colorItemsSelected ?? AppColor.grey2,
          ),
          Text(
            textButton,
            style: TextStyle(
              color: active
                  ? AppColor.primaryColor
                  : colorItemsSelected ?? AppColor.grey2,
            ),
          ),
        ],
      ),
    );
  }
}
