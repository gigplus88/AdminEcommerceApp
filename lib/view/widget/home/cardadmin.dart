import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  final String imagesUrl;
  final String title;
  final void Function() onTap;

  const CardAdmin({
    super.key,
    required this.imagesUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(imagesUrl, width: 100), Text("$title")],
        ),
      ),
    );
  }
}
