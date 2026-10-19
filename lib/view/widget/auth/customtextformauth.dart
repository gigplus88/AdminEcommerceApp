import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? isPassword;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.isPassword,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText: isPassword == null || isPassword == false ? false : true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(child: Icon(icon), onTap: onTapIcon),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),

          label: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(label.tr),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintStyle: const TextStyle(fontSize: 15),
          hintText: hintText.tr,
        ),
      ),
    );
  }
}
