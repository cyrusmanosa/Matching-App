import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseButton extends StatelessWidget {
  BaseButton({
    Key? key,
    this.alignment,
    this.buttonStyle,
    this.buttonTextStyle,
    this.height,
    this.isDisabled,
    this.margin,
    this.onPressed,
    this.width,
    required this.text,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
