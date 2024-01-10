import 'package:flutter/material.dart';

class CustomDropDownBar extends StatelessWidget {
  CustomDropDownBar({
    Key? key,
    this.alignment,
    this.borderDecoration,
    this.controller,
    this.contentPadding,
    this.fillColor,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.initialValue,
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
    this.items,
    this.itemArray,
    this.value,
    this.onChanged,
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
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final List<DropdownMenuItem<String>>? items;
  final List<String>? itemArray;
  final String? value;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return alignment != null
            ? Align(alignment: alignment ?? Alignment.center, child: dropdownFormFieldWidget(mediaH, mediaW))
            : dropdownFormFieldWidget(mediaH, mediaW);
      },
    );
  }

  Widget dropdownFormFieldWidget(double mediaH, double mediaW) {
    return Container(
      height: height ?? mediaH / 25,
      width: width ?? mediaW / 1.2,
      child: DropdownButtonFormField<String>(
        value: controller!.text.isNotEmpty ? controller!.text : null,
        items: itemArray!.map((option) {
          return DropdownMenuItem(value: option, child: Text(option));
        }).toList(),
        onChanged: (value) {
          controller!.text = value!;
        },
        decoration: decoration,
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.only(top: -10),
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: hintStyle,
        isDense: false,
        prefix: prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: Colors.pink, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: Colors.red, width: 2)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: Colors.red, width: 2)),
      );
}
