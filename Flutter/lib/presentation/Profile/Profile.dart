import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import '../Profile/widgets/shownicknamebar_item_widget.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(
            imagePath: ImageConstant.imgWarning,
            height: mediaQueryData.size.height / 20,
            width: mediaQueryData.size.width / 10,
            alignment: Alignment.center,
          ),

          // Word
          content: Container(
            width: mediaQueryData.size.width / 1.1,
            child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            CustomOutlinedButton(
              alignment: Alignment.center,
              text: "OK",
              margin: EdgeInsets.only(bottom: mediaQueryData.size.height / 100),
              onPressed: () {
                onTapReturn(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<CanChange>(
          future: getCanChangeGrpcRequest(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Header
                      _buildHeader(context),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            // img
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Profile img
                                CustomImageView(
                                  imagePath: ImageConstant.imgVectorgray500,
                                  height: 150.adaptSize,
                                  width: 150.adaptSize,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                ),

                                // 4
                                CustomImageView(
                                  imagePath: ImageConstant.imgPhotoSet,
                                  height: 170.v,
                                  width: 50.h,
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
                            SizedBox(height: 100.v),

                            // title
                            Text("個人基本情報", style: CustomTextStyles.smallTitle20),
                            SizedBox(height: 25.v),

                            // Nick Name
                            ShownDataBarWidget(item: "ニックネーム", data: data.nickName),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "身長", data: data.height.toString() + " CM"),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "体重", data: data.weight.toString() + " KG"),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "居住地", data: data.city),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "学歴", data: data.education),
                            SizedBox(height: 25.v),

                            // TODO: 1
                            ShownDataBarWidget(item: "趣味", data: "#################"),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "職種", data: data.job),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "性的指向", data: data.sexual),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "社交力", data: data.sociability),
                            SizedBox(height: 25.v),

                            // TODO: 2
                            ShownDataBarWidget(item: "探す対象", data: "#########"),
                            SizedBox(height: 25.v),

                            // TODO: 3
                            ShownDataBarWidget(item: "目的", data: "############"),
                            SizedBox(height: 25.v),
                            ShownDataBarWidget(item: "宗教", data: data.religious),

                            SizedBox(height: mediaQueryData.size.height / 25),

                            // edit button
                            CustomOutlinedButton(
                              text: "編集",
                              onPressed: () {
                                onTapNextButton(context);
                              },
                            ),
                            SizedBox(height: mediaQueryData.size.height / 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 137.h, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SizedBox(height: 40), Text("プロフィール", style: theme.textTheme.headlineMedium)],
      ),
    );
  }

  // Part2
  Widget _buildInformationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("交換回数", style: theme.textTheme.titleMedium),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: 65.v, child: VerticalDivider(thickness: 1.v, indent: 17.h, endIndent: 18.h)),
          Column(
            children: [
              Text("クレーム回数", style: theme.textTheme.titleMedium),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
          SizedBox(height: 65.v, child: VerticalDivider(thickness: 1.v, indent: 17.h, endIndent: 18.h)),
          Column(
            children: [
              Text("伝送回数", style: theme.textTheme.titleMedium),
              Text("0", style: theme.textTheme.headlineMedium),
            ],
          ),
        ],
      ),
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

// edit button
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
