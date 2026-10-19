import 'package:admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class logoAuth extends StatelessWidget {
  const logoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo, height: 220);
  }
}
