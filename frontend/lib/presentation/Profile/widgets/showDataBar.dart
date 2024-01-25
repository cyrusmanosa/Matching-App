import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class ShownDataBarWidget extends StatelessWidget {
  const ShownDataBarWidget({
    Key? key,
    this.item,
    this.data,
  }) : super(key: key);

  final String? item;
  final String? data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;

    return Container(
      height: mediaH / 25,
      width: mediaW / 1.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item!, style: CustomTextStyles.showDataTitle),
          Text(data!, style: CustomTextStyles.smallTitle20),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: appTheme.grey500)),
      ),
    );
  }
}
