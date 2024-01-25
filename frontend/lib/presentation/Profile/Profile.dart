import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/Information.dart';
import 'package:dating_your_date/presentation/InformationEdit.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/button/Custom_Profile_button.dart';
import 'package:dating_your_date/widgets/Custom_Show_Image.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File myImg1 = File('');
  File myImg2 = File('');
  File myImg3 = File('');
  File myImg4 = File('');
  File myImg5 = File('');
  List<Uint8List> allMyImg = [];

  String send = "";
  String changeTime = "";
  CanChange cCData = CanChange();
  Fix myFixData = Fix();
  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  /// all Manager
  Future<void> fetchData(BuildContext context) async {
    getChangeGrpc(context);
    getImagesGrpc(context);
    getMyselfInfoGrpc(context);
  }

  /// get Myself Data
  Future<void> getChangeGrpc(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final changeRequest = GetChangeTargetRequest(sessionID: apiKeyS);
      final changeResponse = await GrpcInfoService.client.getChangeTarget(changeRequest);
      setState(() {
        changeTime = changeResponse.ct.frequency.toString();
      });
    } on GrpcError catch (e) {
      if (e.code == 13) {
        changeTime = "0";
      } else {
        await showErrorDialog(context, "Error: validatable input UserId in ChangeTarget! $e");
        throw Exception("Error occurred while fetching canChangeInfo.");
      }
    }
    try {
      final sendRequest = GetChatRowRequest(userID: userid);
      final sendResponse = await GrpcChatService.client.getChatRow(sendRequest);
      setState(() {
        send = sendResponse.row.toString();
      });
    } on GrpcError {
      await showErrorDialog(context, "Error: validatable input UserId in Chat Record!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  /// get myself Image
  Future<void> getImagesGrpc(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      // image
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
      if (imgResponse.img.img1.isNotEmpty) {
        Uint8List bytes = Uint8List.fromList(imgResponse.img.img1);
        setState(() {
          allMyImg.add(bytes);
        });
      }

      if (imgResponse.img.img2.isNotEmpty) {
        Uint8List bytes = Uint8List.fromList(imgResponse.img.img2);
        setState(() {
          allMyImg.add(bytes);
        });
      }

      if (imgResponse.img.img3.isNotEmpty) {
        Uint8List bytes = Uint8List.fromList(imgResponse.img.img3);
        setState(() {
          allMyImg.add(bytes);
        });
      }

      if (imgResponse.img.img4.isNotEmpty) {
        Uint8List bytes = Uint8List.fromList(imgResponse.img.img4);
        setState(() {
          allMyImg.add(bytes);
        });
      }

      if (imgResponse.img.img5.isNotEmpty) {
        Uint8List bytes = Uint8List.fromList(imgResponse.img.img5);
        setState(() {
          allMyImg.add(bytes);
        });
      }
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能な入力データ");
      throw Exception("データの送信中にエラーが発生しました。");
    }
  }

  /// get myself info
  Future<void> getMyselfInfoGrpc(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // fix
    try {
      final fRequest = GetFixRequest(sessionID: apiKeyS, userID: userid);
      final fResponse = await GrpcInfoService.client.getFix(fRequest);
      setState(() {
        myFixData = fResponse.fix;
      });
    } on GrpcError catch (e) {
      await showErrorDialog(context, "Error: validatable input UserId in Fixinfo! at $e");
      throw Exception("Error occurred while fetching Fixinfo.");
    }
    // Can Change
    try {
      final cRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      final cResponse = await GrpcInfoService.client.getCanChange(cRequest);
      setState(() {
        cCData = cResponse.canChangeInfo;
      });
    } on GrpcError catch (e) {
      await showErrorDialog(context, "Error: validatable input UserId in Fixinfo! at $e");
      throw Exception("Error occurred while fetching Fixinfo.");
    }
  }

// update icon
  void updateIconGrpcRequest(BuildContext context, int item) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // Get image
    final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
    final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
    try {
      switch (item) {
        case 1:
          List<int> img2B = allMyImg[1].toList();
          final updateImagesRequest = UpdateImagesRequest(
            sessionID: apiKeyS,
            img1: img2B,
            img2: imgResponse.img.img1,
            img3: imgResponse.img.img3,
            img4: imgResponse.img.img4,
            img5: imgResponse.img.img5,
          );
          await GrpcInfoService.client.updateImages(updateImagesRequest);
          break;
        case 2:
          List<int> img3B = allMyImg[2].toList();
          final updateImagesRequest = UpdateImagesRequest(
            sessionID: apiKeyS,
            img1: img3B,
            img2: imgResponse.img.img2,
            img3: imgResponse.img.img1,
            img4: imgResponse.img.img4,
            img5: imgResponse.img.img5,
          );
          await GrpcInfoService.client.updateImages(updateImagesRequest);
          break;
        case 3:
          List<int> img4B = allMyImg[3].toList();
          final updateImagesRequest = UpdateImagesRequest(
            sessionID: apiKeyS,
            img1: img4B,
            img2: imgResponse.img.img2,
            img3: imgResponse.img.img3,
            img4: imgResponse.img.img1,
            img5: imgResponse.img.img5,
          );
          await GrpcInfoService.client.updateImages(updateImagesRequest);
          break;
        case 4:
          List<int> img5B = allMyImg[4].toList();
          final updateImagesRequest = UpdateImagesRequest(
            sessionID: apiKeyS,
            img1: img5B,
            img2: imgResponse.img.img2,
            img3: imgResponse.img.img3,
            img4: imgResponse.img.img4,
            img5: imgResponse.img.img1,
          );
          await GrpcInfoService.client.updateImages(updateImagesRequest);
          break;
      }
      await showLogoDialog(context, "アバターも更新しました", true);
    } on GrpcError {
      await showErrorDialog(context, "エラー：検証可能な入力データ");
      throw Exception("データの送信中にエラーが発生しました。");
    }
  }

// appBar icon to information edit
  void onTapNextPage(BuildContext context) {
    List<Uint8List> newAllMyImg = [allMyImg[0]];
    if (allMyImg.length >= 2) newAllMyImg.add(allMyImg[1]);
    if (allMyImg.length >= 3) newAllMyImg.add(allMyImg[2]);
    if (allMyImg.length >= 4) newAllMyImg.add(allMyImg[3]);
    if (allMyImg.length >= 5) newAllMyImg.add(allMyImg[4]);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InformationEdit(canData: cCData, imgIcon: newAllMyImg, country: myFixData.country), fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("プロフィール"),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 50,
        actions: [
          if (allMyImg.length < 5)
            IconButton(
              padding: EdgeInsets.only(right: mediaW / 30),
              icon: Icon(Icons.add_photo_alternate_outlined),
              onPressed: () {
                onTapNextPage(context);
              },
            ),
        ],
      ),
      backgroundColor: appTheme.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            if (allMyImg.isNotEmpty) _buildImages(context, mediaH, mediaW),
            SizedBox(height: mediaH / 75),
            // Part 2 - cCData!
            if (send.isNotEmpty && changeTime.isNotEmpty) _buildDataBar(context, mediaH, mediaW),
            SizedBox(height: mediaH / 30),
            // Button 1rd
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildUserInfomationBtn(context, mediaH, mediaW), _buildSNSBtn(context, mediaH, mediaW)],
              ),
            ),
            SizedBox(height: mediaH / 30),
            // Button 2rd
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildContextBtn(context, mediaH, mediaW), _buildResetPWtBtn(context, mediaH, mediaW)],
              ),
            ),
            SizedBox(height: mediaH / 30),
            // Logout
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildLogoutBtn(context, mediaH, mediaW)],
              ),
            ),
          ],
        ),
      ),
    );
  }

// images
  Widget _buildImages(BuildContext context, double mediaH, double mediaW) {
    return SizedBox(
      child: Container(
        height: mediaH / 6.5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // far left
            SizedBox(width: mediaW / 25),
            // image
            _buildImageContainer(context, mediaH, mediaW, allMyImg[0], 0),
            if (allMyImg.length >= 2) _buildImageContainer(context, mediaH, mediaW, allMyImg[1], 1),
            if (allMyImg.length >= 3) _buildImageContainer(context, mediaH, mediaW, allMyImg[2], 2),
            if (allMyImg.length >= 4) _buildImageContainer(context, mediaH, mediaW, allMyImg[3], 3),
            if (allMyImg.length >= 5) _buildImageContainer(context, mediaH, mediaW, allMyImg[4], 4),
            // far right
            SizedBox(width: mediaW / 25),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, double mediaH, double mediaW, Uint8List imageFile, int item) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Image(image: MemoryImage(imageFile)),
            actions: [
              if (item != 0)
                CustomOutlinedButton(
                  width: mediaW / 2,
                  alignment: Alignment.center,
                  text: "プロフィール画像に設定する",
                  onPressed: () {
                    updateIconGrpcRequest(context, item);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
      child: Container(child: customImageDesign(context, imageFile, mediaH, mediaW)),
    );
  }

// Data Bar
  Widget _buildDataBar(BuildContext context, double mediaH, double mediaW) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaW / 15),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.profileBtngrey,
          borderRadius: BorderRadiusStyle.r15,
          boxShadow: [BoxShadow(color: appTheme.grey800.withOpacity(0.4), blurRadius: 5, offset: Offset(0, 4))],
        ),
        padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [Text("交換回数", style: CustomTextStyles.inputTitlePink), Text(changeTime, style: CustomTextStyles.dataWord)]),
            SizedBox(height: mediaH / 14, child: VerticalDivider(thickness: 1, indent: 10, endIndent: 10)),
            Column(children: [Text("伝送回数", style: CustomTextStyles.inputTitlePink), Text(send, style: CustomTextStyles.dataWord)]),
          ],
        ),
      ),
    );
  }

// UserInformation
  Widget _buildUserInfomationBtn(BuildContext context, double mediaH, double mediaW) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                List<Uint8List> newAllMyImg = [allMyImg[0]];
                if (allMyImg.length >= 2) newAllMyImg.add(allMyImg[1]);
                if (allMyImg.length >= 3) newAllMyImg.add(allMyImg[2]);
                if (allMyImg.length >= 4) newAllMyImg.add(allMyImg[3]);
                if (allMyImg.length >= 5) newAllMyImg.add(allMyImg[4]);
                return Information(canData: cCData, fixData: myFixData, imgIcon: allMyImg);
              },
            );
          },
          child: Container(
            width: mediaW / 2.5,
            height: mediaH / 15,
            margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
            decoration: BoxDecoration(
              color: appTheme.profileBtngrey,
              borderRadius: BorderRadiusStyle.r15,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.manage_accounts_sharp, color: appTheme.pinkA100, size: mediaW / 9),
                ),
                Text("基本情報", style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }

// SNS
  Widget _buildSNSBtn(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: ProfileButton(
          mediaW: mediaW,
          mediaH: mediaH / 15,
          iconData: Icons.no_accounts_rounded,
          page: AppRoutes.deleteAccount,
          title: "ユーザー削除",
          padding: false,
        ),
      ),
    );
  }

// Reset PW
  Widget _buildResetPWtBtn(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: ProfileButton(
          mediaW: mediaW,
          mediaH: mediaH / 15,
          iconData: Icons.lock_clock_outlined,
          page: AppRoutes.newPasswordSetup,
          title: "パスワード更新",
          padding: false,
        ),
      ),
    );
  }

// Context
  Widget _buildContextBtn(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: ProfileButton(
          mediaW: mediaW,
          mediaH: mediaH / 15,
          iconData: Icons.admin_panel_settings_outlined,
          page: AppRoutes.contactPage,
          title: "連絡",
          padding: false,
        ),
      ),
    );
  }

// Logout
  Widget _buildLogoutBtn(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            await globalSession.delete(key: 'SessionId');
            await globalUserId.delete(key: 'UserId');
            await globalemail.delete(key: 'email');
          },
          child: ProfileButton(
            mediaW: mediaW,
            mediaH: mediaH / 15,
            iconData: Icons.logout_sharp,
            page: AppRoutes.login,
            title: "ログアウト",
            width: mediaW,
            padding: true,
          ),
        ),
      ),
    );
  }
}
