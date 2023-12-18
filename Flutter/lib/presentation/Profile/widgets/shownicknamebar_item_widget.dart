import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class ShownDataBaWidget extends StatelessWidget {
  const ShownDataBaWidget({Key? key, this.item, this.data}) : super(key: key);

  final String? item;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.v,
      width: 330.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // Under bar
          Align(alignment: Alignment.bottomCenter, child: SizedBox(width: 330.h, child: Divider())),
          // Data
          Align(alignment: Alignment.centerRight, child: Text(data!, style: CustomTextStyles.bodyMediumblack)),
          // Theme
          Align(alignment: Alignment.centerLeft, child: Text(item!, style: CustomTextStyles.bodyMediumPinkA100)),
        ],
      ),
    );
  }
}
