import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomDropDownCheckBox extends StatefulWidget {
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
  final String? selectedItem;

  CustomDropDownCheckBox({
    Key? key,
    this.alignment,
    this.autofocus = true,
    this.filled,
    this.obscureText,
    this.prefixConstraints,
    this.suffixConstraints,
    this.fillColor,
    this.width,
    this.height,
    this.contentPadding,
    this.focusNode,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.borderDecoration,
    this.hintText,
    this.initialValue,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.hintStyle,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onTap,
    this.items,
    this.itemArray,
    this.value,
    this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  @override
  _CustomDropDownBarState createState() => _CustomDropDownBarState();
}

class _CustomDropDownBarState extends State<CustomDropDownCheckBox> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return widget.alignment != null
            ? Align(alignment: widget.alignment ?? Alignment.center, child: dropdownCheckBoxWidget(mediaH, mediaW))
            : dropdownCheckBoxWidget(mediaH, mediaW);
      },
    );
  }

  Widget dropdownCheckBoxWidget(double mediaH, double mediaW) {
    return SizedBox(
      height: widget.height ?? mediaH / 25,
      width: widget.width ?? mediaW / 1.2,
      child: DropdownButtonFormField(
        decoration: decoration,
        value: selectedItem,
        items: widget.itemArray!.map((option) {
          return DropdownMenuItem(value: option, child: Text(option));
        }).toList(),
        onChanged: (value) {
          widget.controller!.text = value!;
          widget.onChanged!(value);
          setState(() {
            selectedItem = value;
          });
        },
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        contentPadding: widget.contentPadding ?? EdgeInsets.only(top: -30),
        filled: widget.filled,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        isDense: false,
        prefix: widget.prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: selectedItem != null ? Icon(selectedItem == '項目1' ? Icons.check_box : Icons.check_box_outline_blank) : null,
        suffixIconConstraints: widget.suffixConstraints,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(width: 2)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: appTheme.pinkA100, width: 2)),
      );
}
