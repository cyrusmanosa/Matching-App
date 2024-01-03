import 'package:dating_your_date/presentation/Target/widgets/ResetTargetButton.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class Target extends StatelessWidget {
  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildHeader(context),
      body: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            // _buildHeader(context),
            SizedBox(height: mediaQueryData.size.height / 30),

            // title
            Text("探すターゲットの種類", style: theme.textTheme.headlineSmall),
            SizedBox(height: mediaQueryData.size.height / 30),
            _buildTargetResetList(context)
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: false, title: Text("ターゲットの設定", style: theme.textTheme.headlineMedium));
  }

  /// Section Widget
  Widget _buildTargetResetList(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

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
