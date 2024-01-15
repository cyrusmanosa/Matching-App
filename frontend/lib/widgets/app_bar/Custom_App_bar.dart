import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget buildAppBar(BuildContext context, String title, bool returnIcon) {
  return AppBar(
    automaticallyImplyLeading: returnIcon,
    title: Text(title),
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarHeight: 50,
  );
}
