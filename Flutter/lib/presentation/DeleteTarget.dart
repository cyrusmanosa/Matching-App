import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DeleteTarget extends StatelessWidget {
  DeleteTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return Scaffold(
      appBar: _buildHeader(context),
      body: Container(
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary,
        child: Column(
          children: [
            // Chooes
            SizedBox(height: mediaH / 50),

            // Button
            CustomOutlinedButton(
              text: "削除",
              onPressed: () {
                onTapNextPage(context);
              },
            ),
            SizedBox(height: mediaH / 50),
          ],
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "ターゲットを削除"));
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.warningMsgDeleteUser);
  }
}
