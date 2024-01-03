import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/presentation/ProfileEdit.dart';
import 'package:dating_your_date/widgets/Custom_WarningMsgBox.dart';
import 'widgets/showDataBar.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  // Grpc
  Future<CanChange> getCanChangeGrpcRequest(BuildContext context) async {
    final request = GetCanChangeRequest(sessionID: globalSessionID);
    final response = await GrpcInfoService.client.getCanChange(request);
    // ignore: unnecessary_null_comparison
    if (response == null) {
      showErrorDialog(context, "Error: validatable input data");
    }
    return response.canChangeInfo;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildHeader(context),
      body: FutureBuilder<CanChange>(
        future: getCanChangeGrpcRequest(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
                    child: Column(
                      children: [
                        // img
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Profile img
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorgray500,
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.symmetric(vertical: 10),
                            ),

                            // 4
                            CustomImageView(
                              imagePath: ImageConstant.imgPhotoSet,
                              height: 170,
                              width: 50,
                              margin: EdgeInsets.only(left: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: mediaQueryData.size.height / 50),

                        // Part 2 - data
                        _buildInformationBar(context),
                        SizedBox(height: mediaQueryData.size.height / 50),

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
                        SizedBox(height: mediaQueryData.size.height / 40),

                        // Nick Name
                        ShownDataBarWidget(item: "ニックネーム", data: data.nickName),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // height
                        ShownDataBarWidget(item: "身長", data: data.height.toString() + " CM"),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // weight
                        ShownDataBarWidget(item: "体重", data: data.weight.toString() + " KG"),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // address
                        ShownDataBarWidget(item: "居住地", data: data.city),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // education
                        ShownDataBarWidget(item: "学歴", data: data.education),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // hobby
                        // TODO: 1
                        ShownDataBarWidget(item: "趣味", data: "#################"),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // job
                        ShownDataBarWidget(item: "職種", data: data.job),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // sexual
                        ShownDataBarWidget(item: "性的指向", data: data.sexual),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // sociability
                        ShownDataBarWidget(item: "社交力", data: data.sociability),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // find target
                        // TODO: 2
                        ShownDataBarWidget(item: "探す対象", data: "#########"),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // find reason
                        // TODO: 3
                        ShownDataBarWidget(item: "目的", data: "############"),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // religious
                        ShownDataBarWidget(item: "宗教", data: data.religious),
                        SizedBox(height: mediaQueryData.size.height / 40),
                        // edit button
                        _buildEditButton(context, data)
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: false, title: Text("プロフィール", style: theme.textTheme.headlineMedium));
  }

  // Part2
  Widget _buildInformationBar(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("交換回数", style: CustomTextStyles.inputTitlePink),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: mediaQueryData.size.height / 14, child: VerticalDivider(thickness: 1, indent: 17, endIndent: 18)),
          Column(
            children: [
              Text("クレーム回数", style: CustomTextStyles.inputTitlePink),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: mediaQueryData.size.height / 14, child: VerticalDivider(thickness: 1, indent: 17, endIndent: 18)),
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
