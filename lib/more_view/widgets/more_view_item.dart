import 'package:flutter/material.dart';

class MoreViewItem extends StatelessWidget {
  const MoreViewItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
    required this.icon,
  });

  final String title;
  final String? subtitle;
  final GestureTapCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      leading: icon,
      onTap: onTap,
    );
  }
}
