import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShownDataBarWidget extends StatelessWidget {
  ShownDataBarWidget({Key? key, this.item, this.data}) : super(key: key);

  final String? item;
  final String? data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return SizedBox(
      height: mediaH / 35,
      width: mediaW / 1.3,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // Under bar
          Align(alignment: Alignment.bottomCenter, child: SizedBox(width: mediaW / 1.3, child: Divider())),
          // Data
          Align(alignment: Alignment.centerRight, child: Text(data!, style: CustomTextStyles.smallTitle20)),
          // Theme
          Align(alignment: Alignment.centerLeft, child: Text(item!, style: CustomTextStyles.showDataTitle)),
        ],
      ),
    );
  }
}
