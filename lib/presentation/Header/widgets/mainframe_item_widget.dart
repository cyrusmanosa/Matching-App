import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainframeItemWidget extends StatelessWidget {
  const MainframeItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "観賞回数：",
                style: CustomTextStyles.titleLargePrimary,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "０",
                  style: CustomTextStyles.titleLargePrimary,
                ),
              ),
            ],
          ),
          Container(
            height: 570.v,
            width: 350.h,
            decoration: BoxDecoration(
              color: appTheme.gray500,
              borderRadius: BorderRadius.circular(
                30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
