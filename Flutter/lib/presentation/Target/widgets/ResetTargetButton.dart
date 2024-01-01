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
      width: mediaQueryData.size.width / 15,
      height: mediaQueryData.size.height / 6.5,
      text: title!,
      buttonTextStyle: TextStyle(fontSize: mediaQueryData.size.width / 15, fontWeight: FontWeight.w500),
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
