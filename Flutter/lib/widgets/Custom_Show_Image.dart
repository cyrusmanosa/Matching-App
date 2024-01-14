import 'dart:io';

import 'package:dating_your_date/theme/theme_helper.dart';
import 'package:flutter/material.dart';

Widget customImageDesign(BuildContext context, File img, double mediaH, double mediaW) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
    width: mediaH / 6.5,
    height: mediaH / 6.5,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [BoxShadow(color: appTheme.gray800.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))],
    ),
    child: ClipOval(
      child: Container(
        width: mediaH / 6.5,
        height: mediaH / 6.5,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Image.file(img, fit: BoxFit.cover),
      ),
    ),
  );
}
