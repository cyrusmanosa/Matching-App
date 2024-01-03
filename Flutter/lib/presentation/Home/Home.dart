import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:grpc/grpc.dart';

import 'widgets/HomeUserSide.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    checkDataGrpcRequest(context);
  }

// Grpc
  void checkDataGrpcRequest(BuildContext context) async {
    final request = GetCanChangeRequest(sessionID: globalSessionID);
    try {
      await GrpcInfoService.client.getCanChange(request);
    } on GrpcError catch (e) {
      if (e.code == 13) {
        showErrorDialog(context, "個人情報はまだ開いてます");
      }
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
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
              text: "入力へ",
              margin: EdgeInsets.only(bottom: mediaQueryData.size.height / 100),
              onPressed: () {
                onTapCanChange(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(context),
      body: Container(
        width: double.maxFinite,
        child: Column(children: [Expanded(child: _buildMainFrame(context))]),
      ),
    );
  }

  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: false, title: Text("ホーム", style: theme.textTheme.headlineMedium));
  }

// User Side Show
  Widget _buildMainFrame(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(height: mediaQueryData.size.height / 30),
        SizedBox(
          height: mediaQueryData.size.height / 1.5,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 11),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: mediaQueryData.size.width / 22),
            itemCount: 3,
            itemBuilder: (context, index) {
              return MainframeItemWidget();
            },
          ),
        ),
      ],
    );
  }
}

onTapCanChange(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
}
