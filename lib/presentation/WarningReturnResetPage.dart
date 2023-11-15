import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class WarningReturnResetPage extends StatelessWidget {
  const WarningReturnResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 15.h,
            top: 202.v,
            right: 15.h,
          ),
          child: Column(
            children: [
              SizedBox(height: 15.v),
              _buildWarningOfReturnColumn(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWarningOfReturnColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 38.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.r30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "警告",
            style: theme.textTheme.headlineLarge,
          ),
          Text(
            "一旦、確認するボタンを押したら、条件はもう一度設定しますのでお確認してください",
            style: CustomTextStyles.bodyLargeBlack900,
          ),
          SizedBox(height: 12.v),
          CustomOutlinedButton(
            height: 38.v,
            width: 96.h,
            text: "了解",
            buttonTextStyle: theme.textTheme.titleSmall!,
          ),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }
}
