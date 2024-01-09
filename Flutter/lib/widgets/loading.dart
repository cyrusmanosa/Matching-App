import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

Future<void> showLoadDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: appTheme.pinkA100,
            )),
      );
    },
  );
}
