import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage, bool twe) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  double mediaH = mediaQueryData.size.height;
  double mediaW = mediaQueryData.size.width;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
        // Error Logo
        title: CustomImageView(imagePath: ImageConstant.imgWarning, height: mediaH / 20, width: mediaW / 10, alignment: Alignment.center),

        // Word
        content: Container(
          width: mediaW / 1.1,
          child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
        ),
        actions: [
          CustomOutlinedButton(
            alignment: Alignment.center,
            text: "OK",
            margin: EdgeInsets.only(bottom: mediaH / 100),
            onPressed: () {
              if (!twe) Navigator.pop(context);
              if (twe) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

/// ture back
onTapReturn(BuildContext context) {
  Navigator.pop(context);
}
