import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class DeleteTarget extends StatefulWidget {
  DeleteTarget({Key? key, this.oldData, this.newU, this.le, this.type}) : super(key: key);

  final Targetlist? oldData;
  final int? newU;
  final int? le;
  final String? type;

  @override
  State<DeleteTarget> createState() => _DeleteTargetState();
}

class _DeleteTargetState extends State<DeleteTarget> {
  List<bool> isSelectedList = [false, false, false];
  List<Uint8List> icon = [];
  @override
  void initState() {
    super.initState();
    getIcon();
  }

  void getIcon() async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    Uint8List imgBytes = Uint8List(0);
    for (int i = 0; i < 3; i++) {
      switch (i) {
        case 0:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target1ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          setState(() {
            icon.add(imgBytes);
          });
        case 1:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target2ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          setState(() {
            icon.add(imgBytes);
          });
        case 2:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target3ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          setState(() {
            icon.add(imgBytes);
          });
      }
    }
  }

  void changeUserRecord(BuildContext context) async {
    int tnum = 0;
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    final Targetlist newData = widget.oldData!;
    setState(() {
      showLoadDialog(context);
    });
    try {
      for (int i = 0; i < isSelectedList.length; i++) {
        if (isSelectedList[i] == true) {
          tnum = i;
          break;
        }
      }
      switch (tnum) {
        case 0:
          tnum = widget.oldData!.target1ID;
          newData.target1ID = 0;
          newData.t1Type = "null";
          break;
        case 1:
          tnum = widget.oldData!.target2ID;
          newData.target2ID = 0;
          newData.t2Type = "null";
          break;
        case 2:
          tnum = widget.oldData!.target3ID;
          newData.target3ID = 0;
          newData.t3Type = "null";
          break;
      }
      final changeRequest = CreateChangeTargetRequest(sessionID: apiKeyS, changeUserID: tnum, reason: "123");
      await GrpcInfoService.client.createChangeTarget(changeRequest);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayDone(oldData: newData, newU: widget.newU!, le: widget.le!, type: widget.type!),
          fullscreenDialog: true,
        ),
      );
    } on GrpcError catch (e) {
      Navigator.pop(context);
      await showErrorDialog(context, "Error: $e");
      throw Exception("Error occurred while fetching Login.");
    }
  }

  Future<void> showErrorDialogTwo(BuildContext context) async {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(imagePath: ImageConstant.imgWarning, height: mediaH / 20, width: mediaW / 5, alignment: Alignment.center),
          // Word
          content: Container(
            width: mediaW / 1.1,
            child: Text("一旦、確認するボタンを押したら、ご選択のユーザーを削除しましたので、もう一度お確認してください",
                style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                  alignment: Alignment.center,
                  text: "削除確認",
                  onPressed: () {
                    changeUserRecord(context);
                  },
                ),
                SizedBox(width: mediaW / 20),
                CustomOutlinedButton(
                  alignment: Alignment.center,
                  text: "再設定",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "ターゲットを削除", true),
      backgroundColor: appTheme.bgColor,
      body: Container(
        decoration: BoxDecoration(color: appTheme.white),
        child: Column(
          children: [
            _buildMainFrame(context, mediaH, mediaW, isSelectedList),
            SizedBox(height: mediaH / 50),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainFrame(BuildContext context, double mediaH, double mediaW, List<bool> isSelectedList) {
    return Column(
      children: [
        if (icon.length > 0)
          SizedBox(
            height: mediaH / 1.4,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 12),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: mediaW / 22),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildOneFrame(mediaH, mediaW, isSelectedList, index);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildOneFrame(double mediaH, double mediaW, List<bool> isSelectedList, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < isSelectedList.length; i++) {
            if (isSelectedList[i] == true && i != index) {
              isSelectedList[i] = false;
            }
          }
          isSelectedList[index] = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: mediaH / 50),
        height: mediaH / 1.5,
        width: mediaW / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.r30,
          image: DecorationImage(image: MemoryImage(icon[index]), fit: BoxFit.cover),
          boxShadow: isSelectedList[index] ? [BoxShadow(color: appTheme.red.withOpacity(1), blurRadius: 5, spreadRadius: 5)] : [],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "削除",
      onPressed: () {
        showErrorDialogTwo(context);
      },
    );
  }
}
