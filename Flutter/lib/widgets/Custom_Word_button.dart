import 'package:dating_your_date/theme/app_decoration.dart';
import 'package:dating_your_date/theme/custom_text_style.dart';
import 'package:dating_your_date/theme/theme_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WordButton extends StatefulWidget {
  WordButton({super.key, this.msg, this.mediaH, this.mediaW, this.boolbtn});

  final String? msg;
  final double? mediaH;
  final double? mediaW;
  bool? boolbtn;

  @override
  State<WordButton> createState() => _WordButtonState();
}

class _WordButtonState extends State<WordButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: widget.mediaW! / 25,
          width: widget.mediaW! / 25,
          decoration: BoxDecoration(
            color: widget.boolbtn! ? appTheme.green : appTheme.gray500,
            borderRadius: BorderRadiusStyle.r15,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.mediaW! / 50),
          child: Text(widget.msg!, style: widget.boolbtn! ? CustomTextStyles.confirmGreen : CustomTextStyles.confirmGray),
        ),
      ],
    );
  }
}
