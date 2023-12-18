import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/custom_warningMsgBox.dart';
import 'package:flutter/material.dart';

class WarningMsgDeleteUser extends StatelessWidget {
  const WarningMsgDeleteUser({Key? key}) : super(key: key);

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          title: CustomImageView(imagePath: ImageConstant.imgWarning, height: 40, width: 50, alignment: Alignment.center),
          content: Text(
            "一旦、確認するボタンを押したら、ご選択のユーザーを削除しましたので、もう一度お確認してください",
          ),
          contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
          actions: [
            CustomOutlinedButton(
              alignment: Alignment.center,
              text: "削除確認",
              buttonTextStyle: theme.textTheme.titleMedium!,
              onPressed: () {
                onTapNextButton(context);
              },
              margin: EdgeInsets.only(bottom: 15, top: 10),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return CustomWarningMsgBox(
      btnTitle: "削除確認",
      msg: "一旦、確認するボタンを押したら、ご選択のユーザーを削除しましたので、もう一度お確認してください",
      page: onTapNextButton(context),
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newTargetReady);
  }
}
