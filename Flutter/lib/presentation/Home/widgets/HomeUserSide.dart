import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/presentation/UserPage.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class MainframeItemWidget extends StatefulWidget {
  MainframeItemWidget({Key? key, this.mediaH, this.mediaW, this.targetId, this.img}) : super(key: key);

  final double? mediaH;
  final double? mediaW;
  final int? targetId;
  final File? img;

  @override
  _MainframeItemWidget createState() => _MainframeItemWidget();
}

class _MainframeItemWidget extends State<MainframeItemWidget> {
  Fix? fixData;
  CanChange? data;

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    await getFixGrpc(context);
    await getCanChageGrpc(context);

    print(fixData);
    print(data);
  }

  /// get Fix
  Future<void> getFixGrpc(BuildContext context) async {
    if (widget.targetId! != 0)
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = GetFixRequest(sessionID: apiKeyS, userID: widget.targetId);
        final response = await GrpcInfoService.client.getFix(request);
        fixData = response.fix;
      } on GrpcError {
        showErrorDialog(context, "Error: validatable get Can Change!");
        throw Exception("Error occurred while fetching Can Change.");
      }
  }

  /// get can change
  Future<void> getCanChageGrpc(BuildContext context) async {
    if (widget.targetId! != 0)
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = GetCanChangeRequest(sessionID: apiKeyS, userID: widget.targetId);
        final response = await GrpcInfoService.client.getCanChange(request);
        data = response.canChangeInfo;
      } on GrpcError {
        showErrorDialog(context, "Error: validatable get Can Change!");
        throw Exception("Error occurred while fetching Can Change.");
      }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mediaW! / 1.22,
      child: Column(
        children: [
          SizedBox(height: widget.mediaH! / 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("観賞回数：", style: CustomTextStyles.smallTitle20), Text("０", style: CustomTextStyles.smallTitle20)],
          ),
          SizedBox(height: widget.mediaH! / 100),

          if (widget.targetId! != 0)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => UserPage(
                      fixData: fixData,
                      canData: data,
                      img: widget.img,
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation.drive(Tween(begin: Offset(0.0, 1.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease))),
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
                  image: DecorationImage(image: FileImage(widget.img!), fit: BoxFit.cover),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), spreadRadius: 5, blurRadius: 10)],
                ),
              ),
            ),

          // not user
          if (widget.targetId! == 0 && widget.img!.existsSync())
            Container(
              height: widget.mediaH! / 1.6,
              width: widget.mediaW! / 1.25,
              decoration: BoxDecoration(
                color: appTheme.gray500,
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
            )
        ],
      ),
    );
  }
}
