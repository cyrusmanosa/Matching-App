<<<<<<< HEAD
import 'dart:io';
import 'dart:typed_data';

=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
<<<<<<< HEAD
import 'package:dating_your_date/pb/rpc_images.pb.dart';
=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
<<<<<<< HEAD
import 'package:path_provider/path_provider.dart';
=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a

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
<<<<<<< HEAD
  List<File> icon = [];
  @override
  void initState() {
    super.initState();
    getIcon(context);
  }

  void getIcon(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    Uint8List imgBytes = Uint8List(0);
    for (int i = 0; i < 3; i++) {
      switch (i) {
        case 0:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target1ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          String filePath = '${documentsDirectory.path}/img1.bin';
          File file = File(filePath);
          await file.writeAsBytes(imgBytes);
          setState(() {
            icon.add(file);
          });
        case 1:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target2ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          String filePath = '${documentsDirectory.path}/img1.bin';
          File file = File(filePath);
          await file.writeAsBytes(imgBytes);
          setState(() {
            icon.add(file);
          });
        case 2:
          final req = GetImagesRequest(sessionID: apiKeyS, userID: widget.oldData!.target3ID);
          final rsp = await GrpcInfoService.client.getImages(req);
          imgBytes = Uint8List.fromList(rsp.img.img1);
          String filePath = '${documentsDirectory.path}/img1.bin';
          File file = File(filePath);
          await file.writeAsBytes(imgBytes);
          setState(() {
            icon.add(file);
          });
      }
    }
  }

=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "ターゲットを削除", true),
      backgroundColor: appTheme.bgColor,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
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
        SizedBox(
          height: mediaH / 1.4,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 12),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: mediaW / 22),
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildOneFrame(context, mediaH, mediaW, isSelectedList, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOneFrame(BuildContext context, double mediaH, double mediaW, List<bool> isSelectedList, int index) {
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
<<<<<<< HEAD
          borderRadius: BorderRadiusStyle.r30,
          image: DecorationImage(image: FileImage(icon[index]), fit: BoxFit.cover),
=======
          color: appTheme.grey500,
          borderRadius: BorderRadiusStyle.r30,
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
          boxShadow: isSelectedList[index] ? [BoxShadow(color: Colors.red.withOpacity(1), blurRadius: 5, spreadRadius: 5)] : [],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "削除",
      onPressed: () {
        changeUserRecord(context);
      },
    );
  }
}
