import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget buildAppBar(BuildContext context, String title, bool returnIcon) {
  return AppBar(
    automaticallyImplyLeading: returnIcon,
    title: AppbarTitle(text: title),
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarHeight: 50,
  );
}
