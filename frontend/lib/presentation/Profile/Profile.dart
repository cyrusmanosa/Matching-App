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
import 'package:dating_your_date/widgets/button/Custom_Profile_button.dart';
import 'package:dating_your_date/widgets/Custom_Show_Image.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, this.send, this.changeTime, this.allMyImg}) : super(key: key);
  final List<File>? allMyImg;

  final String? send;
  final String? changeTime;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File myImg1 = File('');
  File myImg2 = File('');
  File myImg3 = File('');
  File myImg4 = File('');
  File myImg5 = File('');
  String send = "";
  String changeTime = "";
  CanChange? cCData = CanChange();
  Fix? myFixData = Fix();

  @override
  void initState() {
    super.initState();
    fetchData(context);
    getChangeGrpcRequest(context);
    getImagesGrpcRequest(context);
  }

  Future<void> fetchData(BuildContext context) async {
    await getMyselfGrpc(context);
  }

  /// get myself Fix
  Future<void> getMyselfGrpc(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final request = GetFixRequest(sessionID: apiKeyS, userID: userid);
      final response = await GrpcInfoService.client.getFix(request);
      myFixData = response.fix;
    } on GrpcError {
      showErrorDialog(context, "Error: validatable get Can Change!");
      throw Exception("Error occurred while fetching Can Change.");
    }
    try {
      final cCRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      final cCResponse = await GrpcInfoService.client.getCanChange(cCRequest);
      setState(() {
        cCData = cCResponse.canChangeInfo;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Can Change Table!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  /// get myself Image
  Future<void> getImagesGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      // image
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      if (imgResponse.img.img1.isNotEmpty) {
        String filePath1 = '${documentsDirectory.path}/img1.bin';
        File file1 = File(filePath1);
        Uint8List bytes1 = Uint8List.fromList(imgResponse.img.img1);
        await file1.writeAsBytes(bytes1);
        setState(() {
          myImg1 = file1;
        });
      }

      if (imgResponse.img.img2.isNotEmpty) {
        String filePath2 = '${documentsDirectory.path}/img2.bin';
        File file2 = File(filePath2);
        Uint8List bytes2 = Uint8List.fromList(imgResponse.img.img2);
        await file2.writeAsBytes(bytes2);
        setState(() {
          myImg2 = file2;
        });
      }

      if (imgResponse.img.img3.isNotEmpty) {
        String filePath3 = '${documentsDirectory.path}/img3.bin';
        File file3 = File(filePath3);
        Uint8List bytes3 = Uint8List.fromList(imgResponse.img.img3);
        await file3.writeAsBytes(bytes3);
        setState(() {
          myImg3 = file3;
        });
      }

      if (imgResponse.img.img4.isNotEmpty) {
        String filePath4 = '${documentsDirectory.path}/img4.bin';
        File file4 = File(filePath4);
        Uint8List bytes4 = Uint8List.fromList(imgResponse.img.img4);
        await file4.writeAsBytes(bytes4);
        setState(() {
          myImg4 = file4;
        });
      }

      if (imgResponse.img.img5.isNotEmpty) {
        String filePath5 = '${documentsDirectory.path}/img5.bin';
        File file5 = File(filePath5);
        Uint8List bytes5 = Uint8List.fromList(imgResponse.img.img5);
        await file5.writeAsBytes(bytes5);
        setState(() {
          myImg5 = file5;
        });
      }
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Image!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  /// get Data
  void getChangeGrpcRequest(BuildContext context) async {
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
        showErrorDialog(context, "Error: validatable input UserId in ChangeTarget! $e");
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
      showErrorDialog(context, "Error: validatable input UserId in Chat Record!");
      throw Exception("Error occurred while fetching canChangeInfo.");
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
          Uint8List bytes = myImg2.readAsBytesSync();
          List<int> img2B = bytes.toList();
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
          Uint8List bytes = myImg3.readAsBytesSync();
          List<int> img3B = bytes.toList();
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
          Uint8List bytes = myImg4.readAsBytesSync();
          List<int> img4B = bytes.toList();
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
          Uint8List bytes = myImg5.readAsBytesSync();
          List<int> img5B = bytes.toList();
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
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Chat Record!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  void onTapNextPage(BuildContext context) {
    List<File> allMyImg = [myImg1];
    if (myImg2.existsSync()) allMyImg.add(myImg2);
    if (myImg3.existsSync()) allMyImg.add(myImg3);
    if (myImg4.existsSync()) allMyImg.add(myImg4);
    if (myImg5.existsSync()) allMyImg.add(myImg5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformationEdit(canData: cCData, imgIcon: allMyImg), fullscreenDialog: true),
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
          if (!myImg5.existsSync())
            IconButton(
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
            _buildImages(context, mediaH, mediaW),
            SizedBox(height: mediaH / 75),
            // Part 2 - cCData!
            _buildDataBar(context, mediaH, mediaW),
            SizedBox(height: mediaH / 30),

            // Button 1rd
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // User Information
                  _buildUserInfomationBtn(context, mediaH, mediaW),
                  // SNS
                  _buildSNSBtn(context, mediaH, mediaW),
                ],
              ),
            ),
            SizedBox(height: mediaH / 30),
            // Button 2rd
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContextBtn(context, mediaH, mediaW),
                  // Reset PW
                  _buildResetPWtBtn(context, mediaH, mediaW),
                ],
              ),
            ),
            SizedBox(height: mediaH / 30),
            // Logout
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogoutBtn(context, mediaH, mediaW),
                ],
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
            _buildImageContainer(context, mediaH, mediaW, myImg1, 0),
            if (myImg2.existsSync()) _buildImageContainer(context, mediaH, mediaW, myImg2, 1),
            if (myImg3.existsSync()) _buildImageContainer(context, mediaH, mediaW, myImg3, 2),
            if (myImg4.existsSync()) _buildImageContainer(context, mediaH, mediaW, myImg4, 3),
            if (myImg5.existsSync()) _buildImageContainer(context, mediaH, mediaW, myImg5, 4),

            // far right
            SizedBox(width: mediaW / 25),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, double mediaH, double mediaW, File imageFile, int item) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Image.file(imageFile),
            actions: [
              if (item != 0)
                CustomOutlinedButton(
                  width: mediaW / 2,
                  alignment: Alignment.center,
                  text: "プロフィール画像に設定する",
                  onPressed: () {
                    updateIconGrpcRequest(context, item);
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
          color: appTheme.profileBtnGray,
          borderRadius: BorderRadiusStyle.r15,
          boxShadow: [BoxShadow(color: appTheme.gray800.withOpacity(0.4), blurRadius: 5, offset: Offset(0, 4))],
        ),
        padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("交換回数", style: CustomTextStyles.inputTitlePink),
                Text(changeTime ?? "0", style: CustomTextStyles.dataWord),
              ],
            ),
            SizedBox(height: mediaH / 14, child: VerticalDivider(thickness: 1, indent: 10, endIndent: 10)),
            Column(
              children: [
                Text("伝送回数", style: CustomTextStyles.inputTitlePink),
                Text(send ?? "0", style: CustomTextStyles.dataWord),
              ],
            ),
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
                List<File> allMyImg = [myImg1];
                if (myImg2.existsSync()) allMyImg.add(myImg2);
                if (myImg3.existsSync()) allMyImg.add(myImg3);
                if (myImg4.existsSync()) allMyImg.add(myImg4);
                if (myImg5.existsSync()) allMyImg.add(myImg5);
                return Information(canData: cCData, fixData: myFixData, imgIcon: allMyImg);
              },
            );
          },
          child: Container(
            width: mediaW / 2.5,
            margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
            decoration: BoxDecoration(
              color: appTheme.profileBtnGray,
              borderRadius: BorderRadiusStyle.r15,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.manage_accounts_sharp,
                    color: appTheme.pinkA100,
                    size: mediaW / 8,
                  ),
                ),
                SizedBox(height: mediaH / 130),
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
          mediaH: mediaH,
          iconData: Icons.sensor_occupied_sharp,
          page: AppRoutes.information,
          title: "SNS",
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
          mediaH: mediaH,
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
          mediaH: mediaH,
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
          },
          child: ProfileButton(
            mediaW: mediaW,
            mediaH: mediaH,
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
