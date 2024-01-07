import 'package:flutter/material.dart';

Future<void> showLoadDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(alignment: Alignment.center, child: CircularProgressIndicator()),
      );
    },
  );
}
