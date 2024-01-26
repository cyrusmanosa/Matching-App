import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  ProfileButton({super.key, this.mediaW, this.mediaH, this.iconData, this.title, this.page, this.width, this.padding});
  final double? width;
  final bool? padding;
  final double? mediaW;
  final double? mediaH;
  final String? title;
  final String? page;
  final IconData? iconData;

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, widget.page!);
          },
          child: Container(
            width: widget.width ?? widget.mediaW! / 2.5,
            height: widget.mediaH ?? widget.mediaH! / 15,
            margin: EdgeInsets.symmetric(horizontal: widget.mediaW! / 50),
            decoration: BoxDecoration(
              color: appTheme.profileBtngrey,
              borderRadius: BorderRadiusStyle.r15,
              boxShadow: [BoxShadow(color: appTheme.grey800.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
            ),
            child: Row(
              children: [
                Padding(padding: widget.padding! ? EdgeInsets.symmetric(horizontal: widget.mediaW! / 8) : EdgeInsets.zero),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(widget.iconData!, color: appTheme.pinkA100, size: widget.mediaW! / 10),
                ),
                Text(widget.title!, style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
