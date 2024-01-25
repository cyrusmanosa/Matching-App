import 'dart:typed_data';

import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/presentation/UserPage.dart';
import 'package:flutter/material.dart';

class MainframeItemWidget extends StatefulWidget {
  MainframeItemWidget({Key? key, this.mediaH, this.mediaW, this.img, this.fix, this.canChange, this.allImage, this.tType})
      : super(key: key);

  final double? mediaH;
  final double? mediaW;
  final Uint8List? img;
  final List<Uint8List>? allImage;
  final Fix? fix;
  final CanChange? canChange;
  final String? tType;

  @override
  _MainframeItemWidget createState() => _MainframeItemWidget();
}

class _MainframeItemWidget extends State<MainframeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mediaW! / 1.22,
      child: Column(
        children: [
          // not user
          if (widget.canChange!.userID == 0)
            Column(
              children: [
                SizedBox(height: widget.mediaH! / 20),
                Container(
                  height: widget.mediaH! / 1.6,
                  width: widget.mediaW! / 1.25,
                  decoration: BoxDecoration(
                    color: appTheme.grey500,
                    borderRadius: BorderRadiusStyle.r30,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 5, blurRadius: 10)],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, size: widget.mediaH! / 5),
                        Text("ターゲットはまだ探していません", style: TextStyle(fontSize: widget.mediaW! / 25)),
                        SizedBox(height: widget.mediaH! / 7),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: widget.mediaH! / 80),
              ],
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: widget.mediaH! / 20),
                //  user slider
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => UserPage(
                          fixData: widget.fix!,
                          canData: widget.canChange!,
                          img: widget.img!,
                          allImage: widget.allImage!,
                          tType: widget.tType!,
                        ),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position:
                                animation.drive(Tween(begin: Offset(0.0, 1.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease))),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: widget.mediaH! / 1.6,
                    width: widget.mediaW! / 1.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.r30,
                      image: DecorationImage(image: MemoryImage(widget.img!), fit: BoxFit.cover),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), spreadRadius: 5, blurRadius: 10)],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
