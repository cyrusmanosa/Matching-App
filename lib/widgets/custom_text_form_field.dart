import 'package:dating_your_date/core/app_export.dart';
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
    this.maxLength,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.textStyle,
    this.width,
    this.height,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.autofocus = true,
    this.filled = false,
    this.obscureText = false,
  }) : super(key: key);

  final Alignment? alignment;
  final bool? autofocus;
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

  @override
  Widget build(BuildContext context) {
    return alignment != null ? Align(alignment: alignment ?? Alignment.center, child: textFormFieldWidget) : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        height: height,
        width: width ?? double.maxFinite,
        child: TextFormField(
          autofocus: autofocus!,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyLarge,
            border: InputBorder.none,
            prefix: Padding(padding: EdgeInsets.only(left: 15.0)),
          ),
          focusNode: FocusNode(),
          keyboardType: textInputType,
          maxLength: maxLength,
          maxLines: maxLines,
          obscureText: obscureText!,
          style: theme.textTheme.displayLarge,
          textInputAction: textInputAction,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        // Example Word

        contentPadding: contentPadding ?? EdgeInsets.all(5),
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: hintStyle,
        isDense: true,
        prefix: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,

        border: OutlineInputBorder(
          borderRadius: BorderRadiusStyle.r5,
          borderSide: BorderSide(color: appTheme.pinkA100, width: 1),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r5),

        // Error Border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadiusStyle.r5,
          borderSide: BorderSide(color: appTheme.pinkA100, width: 1),
        ),

        // Focus Border
        focusedBorder: borderDecoration ?? InputBorder.none,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadiusStyle.r5,
          borderSide: BorderSide(color: appTheme.pinkA100, width: 1),
        ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadiusStyle.r5,
        borderSide: BorderSide(color: appTheme.pinkA100),
      );
}
