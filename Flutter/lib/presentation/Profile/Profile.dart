import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/widgets/Custom_Profile_button.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final storage = FlutterSecureStorage();
  File? imgIconPath;
  String? send;
  String? changeTime;

  @override
  void initState() {
    super.initState();
    getDataGrpcRequest(context);
  }

  // Grpc
  void getDataGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);

    // image
    try {
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
      Uint8List bytes = Uint8List.fromList(imgResponse.img.img1);

      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String filePath = '${documentsDirectory.path}/data.bin';
      File file = File(filePath);
      final i = await file.writeAsBytes(bytes);

      setState(() {
        imgIconPath = i;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Image!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }

    // Sended Data
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
        showErrorDialog(context, "Error: validatable input UserId in ChangeTarget! $e");
        throw Exception("Error occurred while fetching canChangeInfo.");
      }
    }
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
              child: Column(
                children: [
                  // image
                  _buildImages(context, mediaH),
                  SizedBox(height: mediaH / 75),

                  // Part 2 - data!
                  _buildInformationBar(context, mediaH, mediaW),
                  SizedBox(height: mediaH / 30),

                  // Button 1rd
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 1
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: ProfileButton(
                              mediaW: mediaW,
                              mediaH: mediaH,
                              iconData: Icons.manage_accounts_sharp,
                              page: AppRoutes.information,
                              title: "基本情報",
                            ),
                          ),
                        ),
                        // 2
                        Expanded(
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
                        ),
                        // 3
                        Expanded(
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
                        ),
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
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: ProfileButton(
                              mediaW: mediaW,
                              mediaH: mediaH,
                              iconData: Icons.admin_panel_settings_outlined,
                              page: AppRoutes.information,
                              title: "連絡",
                            ),
                          ),
                        ),
                        // 3
                        Expanded(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImages(BuildContext context, double mediaH) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaH / 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgIconPath != null)
            Container(
              width: mediaH / 6.5,
              height: mediaH / 6.5,
              child: ClipOval(child: Image.file(imgIconPath!, fit: BoxFit.cover)),
            )
          else
            Container(
              width: mediaH / 6.5,
              height: mediaH / 6.5,
              child: Icon(Icons.account_circle, size: mediaH / 6.5, color: appTheme.gray800),
            ),
        ],
      ),
    );
  }

  Widget _buildInformationBar(BuildContext context, double mediaH, double mediaW) {
    return Container(
      width: mediaW / 1.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusStyle.r10,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
