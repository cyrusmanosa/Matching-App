import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

class PayDone extends StatefulWidget {
  PayDone({Key? key, this.oldData, this.newU, this.le, this.type}) : super(key: key);

  final Targetlist? oldData;
  final int? newU;
  final int? le;
  final String? type;
  @override
  _PayDoneState createState() => _PayDoneState();
}

class _PayDoneState extends State<PayDone> {
  @override
  void initState() {
    super.initState();
    updateTargetList(context);
  }

  // Update data
  updateTargetList(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    try {
      final request = UpdateTargetListRequest(sessionID: apiKeyS);
      if (widget.oldData!.target3ID == 0) {
        request.target1ID = widget.oldData!.target1ID;
        request.t1Type = widget.oldData!.t1Type;
        request.target2ID = widget.oldData!.target2ID;
        request.t2Type = widget.oldData!.t2Type;
        // update 3
        request.target3ID = widget.newU!;
        request.t3Type = widget.type!;
      }
      if (widget.oldData!.target2ID == 0) {
        request.target1ID = widget.oldData!.target1ID;
        request.t1Type = widget.oldData!.t1Type;
        // update 2
        request.target2ID = widget.newU!;
        request.t2Type = widget.type!;
        request.target3ID = widget.oldData!.target3ID;
        request.t3Type = widget.oldData!.t3Type;
      }
      if (widget.oldData!.target1ID == 0) {
        // update 1
        request.target1ID = widget.newU!;
        request.t1Type = widget.type!;
        request.target2ID = widget.oldData!.target2ID;
        request.t2Type = widget.oldData!.t2Type;
        request.target3ID = widget.oldData!.target3ID;
        request.t3Type = widget.oldData!.t3Type;
      }

      await GrpcInfoService.client.updateTargetList(request);
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
      throw Exception("ホビーの更新中にエラーが発生しました。");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    bool isPageNavigated = false;

    Future.delayed(
      Duration(seconds: 3),
      () {
        if (!isPageNavigated) {
          isPageNavigated = true;
          Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerScreen(number: 0), fullscreenDialog: true));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      backgroundColor: appTheme.bgColor,
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Logo and Slogan
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4.5),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3.5),
            SizedBox(height: mediaH / 15),

            // Title
            Text("お支払いOK", style: TextStyle(fontSize: 30, color: appTheme.black)),
          ],
        ),
      ),
    );
  }
}
