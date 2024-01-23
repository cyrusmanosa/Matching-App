import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
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

// class _CustomMultiSelectDropDownBarState extends State<CustomMultiSelectDropDownBar> {
//   List<String> selectedValues = [];
//   bool onicon = false;
//   void _toggleSelection(String option) {
//     setState(() {
//       if (selectedValues.contains(option)) {
//         selectedValues.remove(option);
//       } else if (selectedValues.length <= widget.itemArray!.length) {
//         if (selectedValues.length < 3) {
//           selectedValues.add(option);
//         } else {
//           showErrorDialog(context, "選択項目は最大限３個です。");
//         }
//       }
//     });
//     widget.onChanged?.call(selectedValues);
//   }

//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQueryData = MediaQuery.of(context);
//     double mediaH = mediaQueryData.size.height;
//     double mediaW = mediaQueryData.size.width;

//     return SizedBox(
//       height: widget.height ?? mediaH / 15,
//       width: widget.width ?? mediaW / 1.2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           DropdownButtonFormField<String>(
//             style: theme.textTheme.headlineMedium,
//             borderRadius: BorderRadiusStyle.r15,
//             decoration: _getDecoration(),
//             hint: Text('${selectedValues.join(', ')}'),
//             items: (widget.itemArray ?? []).map((option) {
//               return DropdownMenuItem<String>(
//                 value: option,
//                 child: InkWell(
//                   onTap: () {
//                     _toggleSelection(option);
//                   },
//                   child: Row(
//                     children: [
//                       SizedBox(height: mediaH / 20),
//                       Text(option),
//                       if (selectedValues.contains(option)) Icon(Icons.check, color: appTheme.green),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//             onChanged: (value) {
//               widget.onChanged?.call(selectedValues);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   InputDecoration _getDecoration() => InputDecoration(
//         contentPadding: widget.contentPadding ?? EdgeInsets.zero,
//         hintText: widget.hintText,
//         hintStyle: theme.textTheme.bodySmall,
//         isDense: false,
//         prefix: widget.prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
//         border: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(width: 2)),
//         focusedBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(color: appTheme.pinkA100, width: 2)),
//       );
// }

class _CustomMultiSelectDropDownBarState extends State<CustomMultiSelectDropDownBar> {
  List<String> selectedValues = [];
  bool onicon = false;
  GlobalKey _dropdownKey = GlobalKey();

  void _toggleSelection(String option) {
    setState(() {
      if (selectedValues.contains(option)) {
        selectedValues.remove(option);
      } else if (selectedValues.length <= widget.itemArray!.length) {
        if (selectedValues.length < 3) {
          selectedValues.add(option);
        } else {
          showErrorDialog(context, "選択項目は最大限３個です。");
        }
      }
    });
    Future.delayed(Duration(milliseconds: 500));
    Navigator.of(context).pop();
    widget.onChanged?.call(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;

    return SizedBox(
      height: widget.height ?? mediaH / 15,
      width: widget.width ?? mediaW / 1.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              final dynamic dropdown = _dropdownKey.currentState;
              dropdown?.toggleDropdown();
            },
            child: DropdownButtonFormField<String>(
              key: _dropdownKey,
              style: theme.textTheme.headlineMedium,
              borderRadius: BorderRadiusStyle.r15,
              decoration: _getDecoration(),
              hint: Text('${selectedValues.join(', ')}'),
              items: (widget.itemArray ?? []).map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: InkWell(
                    onTap: () {
                      _toggleSelection(option);
                    },
                    child: Row(
                      children: [
                        SizedBox(height: mediaH / 20),
                        Text(option),
                        if (selectedValues.contains(option)) Icon(Icons.check, color: appTheme.green),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _getDecoration() => InputDecoration(
        contentPadding: widget.contentPadding ?? EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodySmall,
        isDense: false,
        prefix: widget.prefix ?? Padding(padding: EdgeInsets.only(left: 15.0)),
        border: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadiusStyle.r15, borderSide: BorderSide(color: appTheme.pinkA100, width: 2)),
      );
}
