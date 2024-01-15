import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetTargetButton extends StatelessWidget {
  ResetTargetButton({Key? key, this.title, this.color, this.sendPage}) : super(key: key);

  final String? title;
  final String? sendPage;
  final ButtonStyle? color;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return CustomElevatedButton(
      width: mediaW / 15,
      height: mediaH / 8,
      text: title!,
      buttonTextStyle: TextStyle(
        fontSize: mediaW / 15,
        fontWeight: FontWeight.w500,
        color: appTheme.white,
        shadows: [Shadow(offset: Offset(0, 4), blurRadius: 5.0, color: Colors.black26)],
      ),
      buttonStyle: color,
      onPressed: () {
        onTapNextPage(context);
      },
    );
  }

  void onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, sendPage!);
  }
}
