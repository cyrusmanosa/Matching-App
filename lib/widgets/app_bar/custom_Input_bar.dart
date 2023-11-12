import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputBar extends StatelessWidget {
  CustomInputBar({
    Key? key,
    this.titleName,
    this.backendPart,
  }) : super(key: key);

  final String? titleName;
  final Widget? backendPart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(titleName!, style: theme.textTheme.titleLarge), backendPart!],
      ),
    );
  }
}
