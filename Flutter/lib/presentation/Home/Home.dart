import 'dart:io';

import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/Home/widgets/HomeUserSide.dart';
import 'package:dating_your_date/widgets/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Targetlist? allTarget;
  List<int> allTargetId = [];
  List<File> allimage = [];

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    await getTargetListGrpc(context);
    await getImageGrpc(context);
    if (allTarget != null) {
      allTargetId = [allTarget!.target1ID, allTarget!.target2ID, allTarget!.target3ID];
    }
  }

  /// get target list
  Future<void> getTargetListGrpc(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final tlRequest = GetTargetListRequest(sessionID: apiKeyS);
      final tlResponse = await GrpcInfoService.client.getTargetList(tlRequest);
      setState(() {
        allTarget = tlResponse.tl;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable get Target List !");
      throw Exception("Error occurred while fetching Target List.");
    }
  }

  /// get img
  Future<void> getImageGrpc(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    Uint8List imgBytes = Uint8List(0);
    for (int i = 0; i < 3; i++) {
      int targetID;
      switch (i) {
        case 0:
          if (allTarget!.target1ID != 0) {
            targetID = allTarget!.target1ID;
            imgBytes = Uint8List.fromList(
                (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img1);
          }
          break;
        case 1:
          if (allTarget!.target2ID != 0) {
            targetID = allTarget!.target2ID;
            imgBytes = Uint8List.fromList(
                (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img2);
          }
          break;
        case 2:
          if (allTarget!.target3ID != 0) {
            targetID = allTarget!.target3ID;
            imgBytes = Uint8List.fromList(
                (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img3);
          }
          break;
      }

      String filePath = '${documentsDirectory.path}/img$i.bin';
      File file = File(filePath);
      await file.writeAsBytes(imgBytes);
      setState(() {
        allimage.add(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "ホーム", false),
      backgroundColor: appTheme.bgColor,
      body: SizedBox(
        height: mediaH / 1.35,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: mediaW / 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return MainframeItemWidget(
              mediaH: mediaH,
              mediaW: mediaW,
              targetId: allTargetId[index] == 0 ? 0 : allTargetId[index],
              img: allimage[index],
            );
          },
        ),
      ),
    );
  }

  void onTapCanChange(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
