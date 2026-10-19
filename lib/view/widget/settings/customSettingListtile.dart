import 'package:flutter/material.dart';

class customSettingListTile extends StatelessWidget {
  final void Function()? onTap;
  final Widget? trailing;
  final String title;

  customSettingListTile({
    super.key,
    this.onTap,
    this.trailing,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: onTap, trailing: trailing, title: Text(title));
  }
}
