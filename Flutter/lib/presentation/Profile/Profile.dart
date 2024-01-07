import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/presentation/ProfileEdit.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:grpc/grpc.dart';
import 'widgets/showDataBar.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  // Grpc
  Future<CanChange> getCanChangeGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final request = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      final response = await GrpcInfoService.client.getCanChange(request);
      return response.canChangeInfo;
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input data");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      body: FutureBuilder<CanChange>(
        future: getCanChangeGrpcRequest(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  _headerBuilder(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
                    child: Column(
                      children: [
                        SizedBox(height: mediaH / 50),
                        _buildImags(context),
                        SizedBox(height: mediaH / 50),

                        // Part 2 - data
                        _buildInformationBar(context),
                        SizedBox(height: mediaH / 40),

                        // intro
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("自己紹介", style: CustomTextStyles.showDataTitle),
                              Divider(),
                              Text(data.introduce, style: CustomTextStyles.smallTitle20),
                            ],
                          ),
                        ),
                        SizedBox(height: 100),

                        // title
                        Text("個人基本情報", style: CustomTextStyles.smallTitle20),
                        SizedBox(height: mediaH / 40),

                        // Nick Name
                        ShownDataBarWidget(item: "ニックネーム", data: data.nickName),
                        SizedBox(height: mediaH / 40),
                        // height
                        ShownDataBarWidget(item: "身長", data: data.height.toString() + " CM"),
                        SizedBox(height: mediaH / 40),
                        // weight
                        ShownDataBarWidget(item: "体重", data: data.weight.toString() + " KG"),
                        SizedBox(height: mediaH / 40),
                        // address
                        ShownDataBarWidget(item: "居住地", data: data.city),
                        SizedBox(height: mediaH / 40),
                        // education
                        ShownDataBarWidget(item: "学歴", data: data.education),
                        SizedBox(height: mediaH / 40),
                        // hobby
                        // TODO: 1
                        ShownDataBarWidget(item: "趣味", data: "#################"),
                        SizedBox(height: mediaH / 40),
                        // job
                        ShownDataBarWidget(item: "職種", data: data.job),
                        SizedBox(height: mediaH / 40),
                        // sexual
                        ShownDataBarWidget(item: "性的指向", data: data.sexual),
                        SizedBox(height: mediaH / 40),
                        // sociability
                        ShownDataBarWidget(item: "社交力", data: data.sociability),
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
                        ShownDataBarWidget(item: "宗教", data: data.religious),
                        SizedBox(height: mediaH / 30),
                        // edit button
                        _buildEditButton(context, data),
                        SizedBox(height: mediaH / 30)
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _headerBuilder(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: mediaH / 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("プロフィール", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))],
        ),
      ),
    );
  }

  Widget _buildImags(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Profile img
        CustomImageView(imagePath: ImageConstant.imgVectorgray500),
      ],
    );
  }

  // Part2
  Widget _buildInformationBar(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaW / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("交換回数", style: CustomTextStyles.inputTitlePink),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: mediaH / 14, child: VerticalDivider(thickness: 1, indent: 17, endIndent: 18)),
          Column(
            children: [
              Text("クレーム回数", style: CustomTextStyles.inputTitlePink),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: mediaH / 14, child: VerticalDivider(thickness: 1, indent: 17, endIndent: 18)),
          Column(
            children: [
              Text("伝送回数", style: CustomTextStyles.inputTitlePink),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
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

  onTapNextPage(BuildContext context, CanChange request) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEdit(canData: request)));
  }
}
