import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        Text(titleName!, style: theme.textTheme.titleLarge),
        Container(
          decoration: BoxDecoration(border: Border.all(color: appTheme.pinkA100), borderRadius: BorderRadiusStyle.r10),
          child: backendPart,
        ),
      ],
    );
  }
}
