import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomDropdownFormBar extends StatelessWidget {
  CustomDropdownFormBar({
    Key? key,
    this.alignment,
    this.decoration,
    this.value,
    this.items,
    this.onChanged,
    this.fillColor,
    this.width,
    this.height,
    this.validator,
    this.prefix,
    this.suffix,
    this.onTap,
  }) : super(key: key);

  final Alignment? alignment;
  final InputDecoration? decoration;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>>? items;
  final ValueChanged<dynamic>? onChanged;
  final Color? fillColor;
  final double? width;
  final double? height;
  final FormFieldValidator<dynamic>? validator;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return alignment != null
            ? Align(alignment: alignment ?? Alignment.center, child: dropdownFormFieldWidget)
            : dropdownFormFieldWidget;
      },
    );
  }

  Widget get dropdownFormFieldWidget => SizedBox(
        height: height ?? mediaQueryData.size.height / 25,
        width: width ?? mediaQueryData.size.width / 1.2,
        child: DropdownButtonFormField(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: decoration?.copyWith(
            contentPadding: EdgeInsets.only(top: -10),
            border: InputBorder.none,
            prefix: Padding(padding: EdgeInsets.only(left: 15.0)),
            filled: true,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyle.r5,
              borderSide: BorderSide(color: appTheme.pinkA100, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyle.r5,
              borderSide: BorderSide(color: appTheme.redA700, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyle.r5,
              borderSide: BorderSide(color: appTheme.blue800, width: 1),
            ),
          ),
          validator: validator,
          onTap: onTap,
        ),
      );
}

/// Extension on [CustomDropdownFormBar] to facilitate inclusion of all types of border style etc
extension DropdownFormFieldStyleHelper on CustomDropdownFormBar {
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadiusStyle.r5,
        borderSide: BorderSide(color: appTheme.pinkA100),
      );
}
