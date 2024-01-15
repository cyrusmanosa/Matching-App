import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputBar extends StatelessWidget {
  CustomInputBar({Key? key, this.titleName, this.backendPart}) : super(key: key);

  final String? titleName;
  final Widget? backendPart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleName!, style: CustomTextStyles.inputTitlePink),
        Container(child: backendPart),
      ],
    );
  }
}
