import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetTargetButton extends StatelessWidget {
  ResetTargetButton({Key? key, this.title, this.color, this.sendPage}) : super(key: key);

  final String? title;
  final String? sendPage;
  final ButtonStyle? color;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: mediaQueryData.size.width / 1.1,
      height: mediaQueryData.size.height / 6,
      text: title!,
      buttonTextStyle: TextStyle(),
      buttonStyle: color,
      onPressed: () {
        onTapNextButton(context);
      },
    );
  }

  void onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, sendPage!);
  }
}
