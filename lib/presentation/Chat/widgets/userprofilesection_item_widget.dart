import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TargetSectionCheckWidget extends StatelessWidget {
  const TargetSectionCheckWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.v),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 75.adaptSize,
            width: 75.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45.h, top: 7.v, bottom: 7.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名前", style: CustomTextStyles.titleLargeBlack900),
                Text("目的：", style: CustomTextStyles.titleLargeBlack900),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
