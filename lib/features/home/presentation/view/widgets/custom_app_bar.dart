import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leading,
    required this.actions,
    this.padding,
  });

  final Widget leading;
  final Widget actions;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Row(children: [leading, const Spacer(), actions]),
    );
  }
}
