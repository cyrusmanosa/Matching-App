import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/ProfileEdit.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'Profile/widgets/showDataBar.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  Information({Key? key}) : super(key: key);
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  CanChange? data = CanChange();
  File? imgIconPath;

  @override
  void initState() {
    super.initState();
    getDataGrpcRequest(context);
  }

  // Grpc
  void getDataGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final infoRequest = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      final infoResponse = await GrpcInfoService.client.getCanChange(infoRequest);
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
      Uint8List bytes = Uint8List.fromList(imgResponse.img.img1);
      Directory tempDir = await getTemporaryDirectory();
      File file = File('${tempDir.path}/data_${DateTime.now().millisecondsSinceEpoch}.bin');
      await file.writeAsBytes(bytes);
      setState(() {
        data = infoResponse.canChangeInfo;
        imgIconPath = file;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Can Change Table!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "基本情報")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 50),
              child: Column(
                children: [
                  _buildImages(context, mediaH),
                  SizedBox(height: mediaH / 100),

                  // intro
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaW / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("自己紹介", style: CustomTextStyles.showDataTitle),
                        Divider(),
                        Text(data!.introduce, style: CustomTextStyles.smallTitle20),
                      ],
                    ),
                  ),
                  SizedBox(height: mediaH / 10),

                  // Nick Name
                  ShownDataBarWidget(item: "ニックネーム", data: data!.nickName),
                  SizedBox(height: mediaH / 40),
                  // height
                  ShownDataBarWidget(item: "身長", data: data!.height.toString() + " CM"),
                  SizedBox(height: mediaH / 40),
                  // weight
                  ShownDataBarWidget(item: "体重", data: data!.weight.toString() + " KG"),
                  SizedBox(height: mediaH / 40),
                  // address
                  ShownDataBarWidget(item: "居住地", data: data!.city),
                  SizedBox(height: mediaH / 40),
                  // education
                  ShownDataBarWidget(item: "学歴", data: data!.education),
                  SizedBox(height: mediaH / 40),
                  // hobby
                  // TODO: 1
                  ShownDataBarWidget(item: "趣味", data: "#################"),
                  SizedBox(height: mediaH / 40),
                  // job
                  ShownDataBarWidget(item: "職種", data: data!.job),
                  SizedBox(height: mediaH / 40),
                  // sexual
                  ShownDataBarWidget(item: "性的指向", data: data!.sexual),
                  SizedBox(height: mediaH / 40),
                  // sociability
                  ShownDataBarWidget(item: "社交力", data: data!.sociability),
                  SizedBox(height: mediaH / 40),
                  // find target
                  // TODO: 2
                  ShownDataBarWidget(item: "探す対象", data: "#########"),
                  SizedBox(height: mediaH / 40),
                  // find reason
                  // TODO: 3
                  ShownDataBarWidget(item: "目的", data: "############"),
                  SizedBox(height: mediaH / 40),
                  // religious
                  ShownDataBarWidget(item: "宗教", data: data!.religious),
                  SizedBox(height: mediaH / 30),
                  // edit button
                  _buildEditButton(context, data!),
                  SizedBox(height: mediaH / 25)
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgIconPath != null)
            Container(
              width: mediaH / 6.5,
              height: mediaH / 6.5,
              child: ClipOval(child: Image.file((imgIconPath!), fit: BoxFit.cover)),
            )
          else
            Icon(Icons.account_circle, size: mediaH / 6.5, color: appTheme.gray800),
        ],
      ),
    );
  }

  /// button
  Widget _buildEditButton(BuildContext context, CanChange data) {
    return CustomOutlinedButton(
      text: "編集",
      onPressed: () {
        onTapNextPage(context, data);
      },
    );
  }

  void onTapNextPage(BuildContext context, CanChange request) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProfileEdit(canData: request, imgIconPath: imgIconPath),
        fullscreenDialog: true,
      ),
    );
  }
}
