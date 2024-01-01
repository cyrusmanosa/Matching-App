import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomInputFormBar extends StatelessWidget {
  CustomInputFormBar({
    Key? key,
    this.alignment,
    this.borderDecoration,
    this.controller,
    this.contentPadding,
    this.fillColor,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.maxLines,
    this.maxLength,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.textStyle,
    this.width,
    this.height,
    this.validator,
    this.textInputAction,
    this.textInputType,
    this.autofocus = true,
    this.filled,
    this.obscureText,
    this.onTap,
  }) : super(key: key);

  final Alignment? alignment;
  final bool autofocus;
  final bool? filled;
  final bool? obscureText;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final Color? fillColor;
  final double? width;
  final double? height;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxLength;
  final InputBorder? borderDecoration;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return alignment != null ? Align(alignment: alignment ?? Alignment.center, child: textFormFieldWidget) : textFormFieldWidget;
      },
    );
  }

  Widget get textFormFieldWidget => Container(
        height: height ?? mediaQueryData.size.height / 25,
        width: width ?? mediaQueryData.size.width / 1.2,
        child: TextFormField(
          autofocus: autofocus,
          controller: controller,
          textAlign: TextAlign.start,
          decoration: decoration,
          focusNode: focusNode,
          keyboardType: textInputType,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          obscureText: obscureText ?? false,
          style: theme.textTheme.displayLarge,
          textInputAction: textInputAction ?? TextInputAction.done,
          validator: validator,
          onTap: onTap,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.only(top: -10),
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall,
        isDense: false,
        prefix: prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        border: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(color: appTheme.pinkA100, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(color: appTheme.red, width: 2)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(color: appTheme.red, width: 2)),
      );
}
