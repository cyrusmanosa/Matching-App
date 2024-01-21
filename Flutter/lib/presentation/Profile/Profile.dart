import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/Information.dart';
import 'package:dating_your_date/presentation/InformationEdit.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Profile_button.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File imgIcon1 = File('');
  File imgIcon2 = File('');
  File imgIcon3 = File('');
  File imgIcon4 = File('');
  File imgIcon5 = File('');
  List<File> allimg = [];
  String? send;
  String? changeTime;
  CanChange? data = CanChange();

  @override
  void initState() {
    super.initState();
    getImagesGrpcRequest(context);
    getSendDataGrpcRequest(context);
    getChangeGrpcRequest(context);
    getDataGrpcRequest(context);
  }

  void _showOriginalImage(BuildContext context, File imageFile, double mediaH, double mediaW, int item) {
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
  }

  // Grpc
  void getImagesGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      // image
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);

      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      // img1
      if (imgResponse.img.img1.isNotEmpty) {
        String filePath1 = '${documentsDirectory.path}/img1.bin';
        File file1 = File(filePath1);
        Uint8List bytes1 = Uint8List.fromList(imgResponse.img.img1);
        await file1.writeAsBytes(bytes1);
        setState(() {
          imgIcon1 = file1;
        });
      }

      // img2
      if (imgResponse.img.img2.isNotEmpty) {
        String filePath2 = '${documentsDirectory.path}/img2.bin';
        File file2 = File(filePath2);
        Uint8List bytes2 = Uint8List.fromList(imgResponse.img.img2);
        await file2.writeAsBytes(bytes2);
        setState(() {
          imgIcon2 = file2;
        });
      }

      // img3
      if (imgResponse.img.img3.isNotEmpty) {
        String filePath3 = '${documentsDirectory.path}/img3.bin';
        File file3 = File(filePath3);
        Uint8List bytes3 = Uint8List.fromList(imgResponse.img.img3);
        await file3.writeAsBytes(bytes3);
        setState(() {
          imgIcon3 = file3;
        });
      }

      // img4
      if (imgResponse.img.img4.isNotEmpty) {
        String filePath4 = '${documentsDirectory.path}/img4.bin';
        File file4 = File(filePath4);
        Uint8List bytes4 = Uint8List.fromList(imgResponse.img.img4);
        await file4.writeAsBytes(bytes4);
        setState(() {
          imgIcon4 = file4;
        });
      }

      // img5
      if (imgResponse.img.img5.isNotEmpty) {
        String filePath5 = '${documentsDirectory.path}/img5.bin';
        File file5 = File(filePath5);
        Uint8List bytes5 = Uint8List.fromList(imgResponse.img.img5);
        await file5.writeAsBytes(bytes5);
        setState(() {
          imgIcon5 = file5;
        });
      }
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Image!", false);
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  void getSendDataGrpcRequest(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // Sended Data
    try {
      final sendRequest = GetChatRowRequest(userID: userid);
      final sendResponse = await GrpcChatService.client.getChatRow(sendRequest);
      setState(() {
        send = sendResponse.row.toString();
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Chat Record!", false);
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  void getChangeGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    // changed data
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
        showErrorDialog(context, "Error: validatable input UserId in ChangeTarget! $e", false);
        throw Exception("Error occurred while fetching canChangeInfo.");
      }
    }
  }

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
          Uint8List bytes = imgIcon2.readAsBytesSync();
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
          Uint8List bytes = imgIcon3.readAsBytesSync();
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
          Uint8List bytes = imgIcon4.readAsBytesSync();
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
          Uint8List bytes = imgIcon5.readAsBytesSync();
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
      showErrorDialog(context, "Error: validatable input UserId in Chat Record!", false);
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  void getDataGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      // Can Change
      final infoRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      final infoResponse = await GrpcInfoService.client.getCanChange(infoRequest);
      setState(() {
        data = infoResponse.canChangeInfo;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Can Change Table!", false);
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  void onTapNextPage(BuildContext context) {
    List<File> allimg = [imgIcon1];
    if (imgIcon2.existsSync()) allimg.add(imgIcon2);
    if (imgIcon3.existsSync()) allimg.add(imgIcon3);
    if (imgIcon4.existsSync()) allimg.add(imgIcon4);
    if (imgIcon5.existsSync()) allimg.add(imgIcon5);
    Navigator.push(
      context,
<<<<<<< HEAD:Flutter/lib/presentation/Profile/Profile.dart
      MaterialPageRoute(builder: (context) => InformationEdit(canData: data, imgIcon: allimg), fullscreenDialog: true),
=======
      MaterialPageRoute(
          builder: (context) => InformationEdit(
                canData: cCData,
                imgIcon: newAllMyImg,
                country: myFixData.country,
              ),
          fullscreenDialog: true),
>>>>>>> parent of f9b9b1f (delete bug):frontend/lib/presentation/Profile/Profile.dart
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
        title: AppbarTitle(text: "プロフィール"),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                // image
                _buildImages(context, mediaH, mediaW),
                SizedBox(height: mediaH / 75),

                // Part 2 - data!
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
                      // Reset PW
                      _buildResetPWtBtn(context, mediaH, mediaW),
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
                      // Context
                      _buildContextBtn(context, mediaH, mediaW),
                      // Logout
                      _buildLogoutBtn(context, mediaH, mediaW)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// images
  Widget _buildImages(BuildContext context, double mediaH, double mediaW) {
<<<<<<< HEAD:Flutter/lib/presentation/Profile/Profile.dart
    return Container(
      height: mediaH / 6.5,
      padding: EdgeInsets.only(left: mediaW / 15),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildImageContainer(context, mediaH, mediaW, imgIcon1, 0),
          if (imgIcon2.existsSync()) _buildImageContainer(context, mediaH, mediaW, imgIcon2, 1),
          if (imgIcon3.existsSync()) _buildImageContainer(context, mediaH, mediaW, imgIcon3, 2),
          if (imgIcon4.existsSync()) _buildImageContainer(context, mediaH, mediaW, imgIcon4, 3),
          if (imgIcon5.existsSync()) _buildImageContainer(context, mediaH, mediaW, imgIcon5, 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
            decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                onTapNextPage(context);
              },
              icon: Icon(Icons.add, size: mediaH / 15, color: appTheme.gray800),
            ),
          ),
        ],
=======
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
>>>>>>> parent of f9b9b1f (delete bug):frontend/lib/presentation/Profile/Profile.dart
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, double mediaH, double mediaW, File imageFile, int item) {
    return InkWell(
      onTap: () {
        _showOriginalImage(context, imageFile, mediaH, mediaW, item);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
        width: mediaH / 6.5,
        height: mediaH / 6.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent, width: 3.5),
        ),
        child: ClipOval(
          child: Container(
            width: mediaH / 6.5,
            height: mediaH / 6.5,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.file(imageFile, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

// UserInformation
  Widget _buildUserInfomationBtn(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      List<File> allimg = [imgIcon1];
                      if (imgIcon2.existsSync()) allimg.add(imgIcon2);
                      if (imgIcon3.existsSync()) allimg.add(imgIcon3);
                      if (imgIcon4.existsSync()) allimg.add(imgIcon4);
                      if (imgIcon5.existsSync()) allimg.add(imgIcon5);
                      return Information(canData: data, imgIcon: allimg);
                    },
                  );
                },
                icon: Icon(Icons.manage_accounts_sharp, color: appTheme.pinkA100),
                iconSize: mediaW / 8,
              ),
            ),
            SizedBox(height: mediaH / 130),
            Text("基本情報", style: theme.textTheme.headlineSmall),
          ],
        ),
      ),
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
          ),
        ),
      ),
    );
  }

// Data Bar
  Widget _buildDataBar(BuildContext context, double mediaH, double mediaW) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("交換回数", style: CustomTextStyles.inputTitlePink),
              Text(changeTime ?? "0", style: CustomTextStyles.profileData),
            ],
          ),
          SizedBox(height: mediaH / 14, child: VerticalDivider(thickness: 1, indent: 10, endIndent: 10)),
          Column(
            children: [
              Text("伝送回数", style: CustomTextStyles.inputTitlePink),
              Text(send ?? "0", style: CustomTextStyles.profileData),
            ],
          ),
        ],
      ),
    );
  }
}
