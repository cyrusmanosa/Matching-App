import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_warningMsgBox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WarningMsgDeleteUser extends StatelessWidget {
  const WarningMsgDeleteUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return CustomWarningMsgBox(
      title: "削除確認",
      msg: "一旦、確認するボタンを押したら、ご選択のユーザーを削除しましたので、もう一度お確認してください",
      // page: onTaptf(context),
    );
  }

  // onTaptf(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.newTargetReady);
  // }
}
