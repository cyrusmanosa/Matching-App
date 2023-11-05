import '../k9_page/widgets/targetresetlist_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class K9Page extends StatelessWidget {
  const K9Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillPrimary,
                child: Column(children: [
                  _buildTargetColumn(context),
                  SizedBox(height: 65.v),
                  Text("探すターゲットの種類",
                      style: CustomTextStyles.headlineMediumBlack900_1),
                  SizedBox(height: 29.v),
                  _buildTargetResetList(context)
                ]))));
  }

  /// Section Widget
  Widget _buildTargetColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 111.h, vertical: 15.v),
        decoration: AppDecoration.fillGray,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(height: 40.v),
          Text("ターゲットの設定", style: theme.textTheme.headlineMedium)
        ]));
  }

  /// Section Widget
  Widget _buildTargetResetList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 29.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TargetresetlistItemWidget(onTaptf: () {
                    onTaptf(context);
                  });
                })));
  }

  /// Navigates to the k3Screen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.HobbyConditionRepair);
  }
}
