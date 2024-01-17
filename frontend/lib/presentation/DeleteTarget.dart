import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class DeleteTarget extends StatefulWidget {
  DeleteTarget({Key? key}) : super(key: key);

  @override
  State<DeleteTarget> createState() => _DeleteTargetState();
}

class _DeleteTargetState extends State<DeleteTarget> {
  List<bool> isSelectedList = [false, false, false];

  void changeTargetUser(BuildContext context) async {
    try {
      setState(() {
        showLoadDialog(context);
      });
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      // take target id
      final targetIDRequest = GetTargetListRequest(sessionID: apiKeyS);
      final tid = await GrpcInfoService.client.getTargetList(targetIDRequest);
      // update target user
      final updateTargetRequest = UpdateTargetListRequest(
        sessionID: apiKeyS,
        target1ID: isSelectedList[0] ? null : tid.tl.target1ID,
        target2ID: isSelectedList[1] ? null : tid.tl.target2ID,
        target3ID: isSelectedList[2] ? null : tid.tl.target3ID,
      );

      await GrpcInfoService.client.updateTargetList(updateTargetRequest);
      changeUserRecord(context, tid);
    } on GrpcError catch (e) {
      Navigator.pop(context);
      await showErrorDialog(context, "Error: $e");
      throw Exception("Error occurred while fetching Target List.");
    }
  }

  void changeUserRecord(BuildContext context, GetTargetListResponse data) async {
    int tnum = 0;
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      for (int i = 0; i < isSelectedList.length; i++) {
        if (isSelectedList[i] == true) {
          tnum = i;
          break;
        }
      }
      switch (tnum) {
        case 0:
          tnum = data.tl.target1ID;
          break;
        case 1:
          tnum = data.tl.target2ID;
          break;
        case 2:
          tnum = data.tl.target3ID;
          break;
      }
      final changeRequest = CreateChangeTargetRequest(sessionID: apiKeyS, changeUserID: tnum, reason: "123");
      await GrpcInfoService.client.createChangeTarget(changeRequest);
      onTapNextPage(context);
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
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
          color: appTheme.grey500,
          borderRadius: BorderRadiusStyle.r30,
          boxShadow: isSelectedList[index] ? [BoxShadow(color: Colors.red.withOpacity(1), blurRadius: 5, spreadRadius: 5)] : [],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "削除",
      onPressed: () {
        changeTargetUser(context);
      },
    );
  }

  void onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payDone);
  }
}
