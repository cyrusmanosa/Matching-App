import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_socialmedia.pb.dart';
import 'package:dating_your_date/pb/socialmedia.pb.dart';
import 'package:dating_your_date/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  SideBar({Key? key, this.targetId, this.sm}) : super(key: key);

  final SocialMedia? sm;
  final int? targetId;

  @override
  State<StatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool? imgBtn;
  bool? conBtn;
  bool? locaBtn;
  bool? datBtn;
  bool? snsBtn;

  @override
  void initState() {
    super.initState();
    imgBtn = widget.sm!.image;
    conBtn = widget.sm!.contact;
    locaBtn = widget.sm!.location;
    datBtn = widget.sm!.appointment;
    snsBtn = widget.sm!.sns;
  }

  void updatesSocialMedia(BuildContext context) async {
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    final req = UpdateSocialMediaRequest(
      userID: userid,
      targetID: widget.targetId!,
      image: imgBtn,
      contact: conBtn,
      appointment: datBtn,
      location: locaBtn,
      sns: snsBtn,
    );
    await GrpcChatService.client.updateSocialMedia(req);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        decoration: BoxDecoration(color: appTheme.pinkA100, borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // add date
            Text("2023-11-01から", style: TextStyle(color: appTheme.grey800)),
            SizedBox(height: mediaH / 300),

            _buildCheckPointRow(mediaH, mediaW),

            // 写真解放
            InkWell(
              onTap: () {
                setState(() {
                  imgBtn = !imgBtn!;
                });
              },
              child: Container(
                width: mediaW / 2.5,
                height: mediaH / 20,
                decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 20),
                      child: Container(
                        height: mediaH / 45,
                        width: mediaW / 20,
                        decoration: BoxDecoration(color: imgBtn! ? appTheme.green : appTheme.grey500, borderRadius: BorderRadiusStyle.r15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("写真解放", style: imgBtn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtongrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaH / 25),

            // 連絡解放
            InkWell(
              onTap: () {
                setState(() {
                  conBtn = !conBtn!;
                });
              },
              child: Container(
                width: mediaW / 2.5,
                height: mediaH / 20,
                decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 20),
                      child: Container(
                        height: mediaH / 45,
                        width: mediaW / 20,
                        decoration: BoxDecoration(color: conBtn! ? appTheme.green : appTheme.grey500, borderRadius: BorderRadiusStyle.r15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("連絡解放", style: conBtn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtongrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaH / 25),

            // 位置共有
            InkWell(
              onTap: () {
                setState(() {
                  locaBtn = !locaBtn!;
                });
              },
              child: Container(
                width: mediaW / 2.5,
                height: mediaH / 20,
                decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 20),
                      child: Container(
                        height: mediaH / 45,
                        width: mediaW / 20,
                        decoration: BoxDecoration(color: locaBtn! ? appTheme.green : appTheme.grey500, borderRadius: BorderRadiusStyle.r15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("位置共有", style: locaBtn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtongrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaH / 25),

            // デート解放
            InkWell(
              onTap: () {
                setState(() {
                  datBtn = !datBtn!;
                });
              },
              child: Container(
                width: mediaW / 2.5,
                height: mediaH / 20,
                decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 20),
                      child: Container(
                        height: mediaH / 45,
                        width: mediaW / 20,
                        decoration: BoxDecoration(color: datBtn! ? appTheme.green : appTheme.grey500, borderRadius: BorderRadiusStyle.r15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("デート解放", style: datBtn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtongrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaH / 25),

            // SNS共有
            InkWell(
              onTap: () {
                setState(() {
                  snsBtn = !snsBtn!;
                });
              },
              child: Container(
                width: mediaW / 2.5,
                height: mediaH / 20,
                decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.r15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 20),
                      child: Container(
                        height: mediaH / 45,
                        width: mediaW / 20,
                        decoration: BoxDecoration(color: snsBtn! ? appTheme.green : appTheme.grey500, borderRadius: BorderRadiusStyle.r15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaW / 50),
                      child: Text("SNS共有", style: snsBtn! ? CustomTextStyles.sideBarButtonGreen : CustomTextStyles.sideBarButtongrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaH / 25),

            _buildNextButton(context, mediaH, mediaW)
          ],
        ),
      ),
    );
  }

  /// item Title
  Widget _buildCheckPointRow(double mediaH, double mediaW) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaH / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Link 1
          Padding(
            padding: EdgeInsets.only(top: mediaH / 65, bottom: mediaH / 65, right: mediaW / 30),
            child: SizedBox(width: mediaW / 10, child: Divider()),
          ),
          // title
          Text("チェックポイント", style: CustomTextStyles.msgWordOfMsgBox),
          // Link 2
          Padding(
            padding: EdgeInsets.only(top: mediaH / 65, bottom: mediaH / 65, left: mediaW / 30),
            child: SizedBox(width: mediaW / 10, child: Divider()),
          ),
        ],
      ),
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context, double mediaH, double mediaW) {
    return CustomElevatedButton(
      width: mediaW / 3,
      text: "解放確認",
      buttonTextStyle: CustomTextStyles.btnWordInSideBar,
      buttonStyle: CustomButtonStyles.fillDarkgrey,
      onPressed: () {
        updatesSocialMedia(context);
      },
    );
  }
}
