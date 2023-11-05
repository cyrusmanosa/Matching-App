import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TargetresetlistItemWidget extends StatelessWidget {
  TargetresetlistItemWidget({
    Key? key,
    this.onTaptf,
  }) : super(
          key: key,
        );

  VoidCallback? onTaptf;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 350.h,
      text: "趣味",
      onPressed: () {
        onTaptf!.call();
      },
    );
  }
}
