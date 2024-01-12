import 'package:dating_your_date/presentation/Home/widgets/HomeUserSide.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkDataGrpcRequest(context);
  }

  void checkDataGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final request = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      await GrpcInfoService.client.getCanChange(request);
    } on GrpcError {
      onTapCanChange(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: AppbarTitle(text: "ホーム")),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: mediaH / 50),
            _buildMainFrame(context, mediaW, mediaW),
          ],
        ),
      ),
    );
  }

  // Main
  Widget _buildMainFrame(BuildContext context, double mediaH, double mediaW) {
    return Column(
      children: [
        SizedBox(
          height: mediaH <= 700 ? 700 : mediaH,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 12),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: mediaW / 22),
            itemCount: 3,
            itemBuilder: (context, index) {
              return MainframeItemWidget(mediaH: mediaH, mediaW: mediaW);
            },
          ),
        ),
      ],
    );
  }

  void onTapCanChange(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
  }
}
