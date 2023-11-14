import 'package:cyrus_man_s_application1/presentation/Target/widgets/ResetTargetButtonCompaionship.dart';
import 'package:cyrus_man_s_application1/presentation/Target/widgets/ResetTargetButtonLover.dart';
import 'widgets/ResetTargetButtonHobby.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class Target extends StatelessWidget {
  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Column(
            children: [
              _buildHeader(context),
              // 題目
              SizedBox(height: 60.v),
              Text("探すターゲットの種類", style: CustomTextStyles.headlineMediumBlack900),
              // 選択
              SizedBox(height: 30.v),
              _buildTargetResetList(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 111, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SizedBox(height: 40), Text("ターゲットの設定", style: theme.textTheme.headlineMedium)],
      ),
    );
  }

  /// Section Widget
  Widget _buildTargetResetList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(height: 15), // 设置垂直间距
          itemBuilder: (context, index) {
            if (index == 0) {
              return ResetTargetButtonHobby();
            } else if (index == 1) {
              return ResetTargetButtonLover();
            } else if (index == 2) {
              return ResetTargetButtonCompaionship();
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
