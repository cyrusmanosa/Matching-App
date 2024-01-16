import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/Home/widgets/HomeUserSide.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> allTargetId = [];
  List<List<File>> allTargetImage = [];
  List<Fix> allTargetFix = List<Fix>.filled(3, Fix());
  List<CanChange> allTargetCanChange = List<CanChange>.filled(3, CanChange());
  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    Targetlist allTarget = await getTargetListGrpc(context);
    allTargetId = await [allTarget.target1ID, allTarget.target2ID, allTarget.target3ID];
    for (int i = 0; i < 3; i++) {
      getTargetImageGrpc(context, allTargetId[i]);
    }
    getTargetDataGrpc(context, allTargetId);
  }

  /// get target list
  Future<Targetlist> getTargetListGrpc(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final tlRequest = GetTargetListRequest(sessionID: apiKeyS);
      final tlResponse = await GrpcInfoService.client.getTargetList(tlRequest);
      return tlResponse.tl;
    } on GrpcError {
      showErrorDialog(context, "エラー：検証可能な入力データ");
      throw Exception("データの送信中にエラーが発生しました。");
    }
  }

  /// get Target icon
  Future<void> getTargetImageGrpc(BuildContext context, int tid) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    Uint8List imgBytes = Uint8List(0);
    List<File> one = [];
    if (tid != 0) {
      final imgData = await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: tid));
      for (int j = 0; j < 5; j++) {
        switch (j) {
          case 0:
            imgBytes = Uint8List.fromList(imgData.img.img1);
            String filePath = '${documentsDirectory.path}/img1.bin';
            File file = File(filePath);
            await file.writeAsBytes(imgBytes);
            setState(() {
              one.add(file);
            });
            break;
          case 1:
            if (imgData.img.img2.isNotEmpty) {
              imgBytes = Uint8List.fromList(imgData.img.img2);
              String filePath = '${documentsDirectory.path}/img2.bin';
              File file = File(filePath);
              await file.writeAsBytes(imgBytes);
              setState(() {
                one.add(file);
              });
            }
            break;
          case 2:
            if (imgData.img.img3.isNotEmpty) {
              imgBytes = Uint8List.fromList(imgData.img.img3);
              String filePath = '${documentsDirectory.path}/img3.bin';
              File file = File(filePath);
              await file.writeAsBytes(imgBytes);
              setState(() {
                one.add(file);
              });
            }
            break;
          case 3:
            if (imgData.img.img4.isNotEmpty) {
              imgBytes = Uint8List.fromList(imgData.img.img4);
              String filePath = '${documentsDirectory.path}/img4.bin';
              File file = File(filePath);
              await file.writeAsBytes(imgBytes);
              setState(() {
                one.add(file);
              });
            }
            break;
          case 4:
            if (imgData.img.img5.isNotEmpty) {
              imgBytes = Uint8List.fromList(imgData.img.img5);
              String filePath = '${documentsDirectory.path}/img5.bin';
              File file = File(filePath);
              await file.writeAsBytes(imgBytes);
              setState(() {
                one.add(file);
              });
            }
            break;
        }
        setState(() {
          allTargetImage.add(one);
        });
      }
    }
  }

  /// get Target Fix
  Future<void> getTargetDataGrpc(BuildContext context, List<int> allTargetId) async {
    for (int i = 0; i < allTargetId.length; i++) {
      if (allTargetId[i] != 0) {
        try {
          String? apiKeyS = await globalSession.read(key: 'SessionId');
          final request = GetFixRequest(sessionID: apiKeyS, userID: allTargetId[i]);
          final response = await GrpcInfoService.client.getFix(request);
          setState(() {
            allTargetFix[i] = response.fix;
          });
        } on GrpcError {
          showErrorDialog(context, "エラー：検証可能な入力データ");
          throw Exception("データの送信中にエラーが発生しました。");
        }

        try {
          String? apiKeyS = await globalSession.read(key: 'SessionId');
          final request = GetCanChangeRequest(sessionID: apiKeyS, userID: allTargetId[i]);
          final response = await GrpcInfoService.client.getCanChange(request);
          setState(() {
            allTargetCanChange[i] = response.canChangeInfo;
          });
        } on GrpcError {
          showErrorDialog(context, "エラー：検証可能な入力データ");
          throw Exception("データの送信中にエラーが発生しました。");
        }
      }
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
          itemCount: allTargetImage.length != 0 ? 3 : 0,
          itemBuilder: (context, index) {
            return MainframeItemWidget(
              mediaH: mediaH,
              mediaW: mediaW,
              img: allTargetImage[index],
              fix: allTargetFix[index],
              canChange: allTargetCanChange[index],
            );
          },
        ),
      ),
    );
  }
}
