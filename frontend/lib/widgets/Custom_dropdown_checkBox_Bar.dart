import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomMultiSelectDropDownBar extends StatefulWidget {
  CustomMultiSelectDropDownBar({
    Key? key,
    this.alignment,
    this.borderDecoration,
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
  final ValueChanged<List<String>>? onChanged;

  @override
  _CustomMultiSelectDropDownBarState createState() => _CustomMultiSelectDropDownBarState();
}

class _CustomMultiSelectDropDownBarState extends State<CustomMultiSelectDropDownBar> {
  List<String> selectedValues = [];

  void _toggleSelection(String option) {
    setState(() {
      if (selectedValues.contains(option)) {
        selectedValues.remove(option);
      } else if (selectedValues.length <= widget.itemArray!.length) {
        selectedValues.add(option);
      }
    });
    widget.onChanged?.call(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return SizedBox(
      height: widget.height ?? mediaH / 13.1,
      width: widget.width ?? mediaW / 1.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            isDense: true,
            itemHeight: mediaH / 18,
            decoration: decoration,
            hint: Text('Select options'),
            items: widget.itemArray?.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: InkWell(
                  onTap: () {
                    _toggleSelection(option);
                  },
                  child: Row(
                    children: [Text(option), if (selectedValues.contains(option)) Icon(Icons.check, color: appTheme.green)],
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
          Padding(
            padding: EdgeInsets.only(top: mediaH / 300),
            child: Text("ご選択：${selectedValues.join(', ')}", style: TextStyle(color: appTheme.grey800)),
          )
        ],
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        contentPadding: widget.contentPadding ?? EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        isDense: false,
        prefix: widget.prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(color: Colors.pink, width: 2)),
      );
}
