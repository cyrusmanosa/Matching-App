import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_warningMsgBox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WarningMsgReturnResetPage extends StatelessWidget {
  const WarningMsgReturnResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return CustomWarningMsgBox(
      title: "了解",
      msg: "一旦、確認するボタンを押したら、条件はもう一度設定しますのでお確認してください",
    );
  }
}
