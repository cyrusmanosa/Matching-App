import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
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
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.textStyle,
    this.width,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.autofocus = true,
    this.filled = false,
    this.obscureText = false,
    required List children,
    required InputDecoration decoration,
  }) : super(key: key);

  final Alignment? alignment;
  final bool? autofocus;
  final bool? filled;
  final bool? obscureText;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final Color? fillColor;
  final double? width;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final InputBorder? borderDecoration;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.bodyLarge,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargePrimary,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(6.h),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ?? InputBorder.none,
        enabledBorder: borderDecoration ?? InputBorder.none,
        focusedBorder: borderDecoration ?? InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.pinkA100,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.pinkA100,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(
          color: appTheme.pinkA100,
          fontSize: 12.fSize,
        ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: appTheme.pinkA100),
      );
}
