import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TargetresetlistItemWidget extends StatelessWidget {
  TargetresetlistItemWidget({Key? key}) : super(key: key);

  List<String> item = ["趣味", "123", "456"];

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 350.h,
      text: "$item",
    );
  }
}

/// Navigates to the k3Screen when the action is triggered.
onTaptf(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.hobbyConditionRepair);
}
