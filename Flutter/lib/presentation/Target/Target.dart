import 'package:dating_your_date/presentation/Target/widgets/ResetTargetButton.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class Target extends StatelessWidget {
  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeader(context),
              SizedBox(height: mediaQueryData.size.height / 30),

              // title
              Text("探すターゲットの種類", style: theme.textTheme.headlineSmall),
              SizedBox(height: mediaQueryData.size.height / 30),
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
        children: [SizedBox(height: mediaQueryData.size.height / 20), Text("ターゲットの設定", style: theme.textTheme.headlineMedium)],
      ),
    );
  }

  /// Section Widget
  Widget _buildTargetResetList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 10),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(height: mediaQueryData.size.height / 30),
          itemBuilder: (context, index) {
            if (index == 0) {
              return ResetTargetButton(title: "趣味", color: CustomButtonStyles.fillLightGray, sendPage: AppRoutes.hobbyConditionRepair);
            } else if (index == 1) {
              return ResetTargetButton(title: "恋人", color: CustomButtonStyles.fillDarkRed, sendPage: AppRoutes.loverConditionRepair);
            } else if (index == 2) {
              return ResetTargetButton(title: "お相伴", color: CustomButtonStyles.fillRed, sendPage: AppRoutes.accompanyConditionRepair);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
