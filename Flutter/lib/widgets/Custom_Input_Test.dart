import 'package:dating_your_date/core/app_export.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomInputSelect extends StatefulWidget {
  CustomInputSelect({
    Key? key,
    this.alignment,
    this.borderDecoration,
    this.controller,
    this.contentPadding,
    this.fillColor,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.mapData,
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
  final Map<String, String>? mapData;
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
  _CustomInputFormBarState createState() => _CustomInputFormBarState();
}

class _CustomInputFormBarState extends State<CustomInputSelect> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return widget.alignment != null
            ? Align(alignment: widget.alignment ?? Alignment.center, child: textFormFieldWidget)
            : textFormFieldWidget;
      },
    );
  }

  Widget get textFormFieldWidget => SizedBox(
        height: widget.height ?? mediaQueryData.size.height / 25,
        width: widget.width ?? mediaQueryData.size.width / 1.2,
        child: DropdownButtonHideUnderline(
          child: Row(
            children: [
              Expanded(
                child: DropdownButton2<String>(
                  hint: Text(
                    widget.hintText!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  items: widget.mapData?.keys
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                      if (widget.controller != null) {
                        widget.controller!.text = widget.mapData![selectedValue]!;
                      }
                      print(widget.controller?.text);
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.r15,
                      color: Colors.white,
                    ),
                    elevation: 1,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadiusStyle.r15, color: appTheme.white),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
