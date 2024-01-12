import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  ProfileButton({super.key, this.mediaW, this.mediaH, this.iconData, this.title, this.page});

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
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusStyle.r15,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
          ),
          child: IconButton(
            padding: EdgeInsets.all(5),
            onPressed: () {
              Navigator.pushNamed(context, widget.page!);
            },
            icon: Icon(widget.iconData!, color: appTheme.pinkA100),
            iconSize: widget.mediaW! / 8,
          ),
        ),
        SizedBox(height: widget.mediaH! / 130),
        Text(
          widget.title!,
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
