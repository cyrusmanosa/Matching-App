import '../Target/widgets/targetresetlist_item_widget.dart';
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
              _buildTargetColumn(context),
              // 題目
              SizedBox(height: 60.v),
              Text(
                "探すターゲットの種類",
                style: CustomTextStyles.headlineMediumBlack900_1,
              ),

              // 選択
              SizedBox(height: 30.v),
              _buildTargetResetList(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Home
  Widget _buildTargetColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 111.h, vertical: 11.v),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20.v),
          Text("ターゲットの設定", style: theme.textTheme.headlineMedium)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTargetResetList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return TargetresetlistItemWidget();
          },
        ),
      ),
    );
  }
}
