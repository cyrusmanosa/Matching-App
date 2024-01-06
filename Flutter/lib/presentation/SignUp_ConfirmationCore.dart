import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_checkEmail.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class ConfirmationCore extends StatelessWidget {
  ConfirmationCore({Key? key}) : super(key: key);

  TextEditingController confirmationCoreController = TextEditingController();

  // Http
  void checkCodeHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/SignUpCheckCode";
    var requestBody = {"checkcode": confirmationCoreController.text};
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextPage(context);
    }
  }

  // Grpc
  void checkCodeGrpcRequest(BuildContext context) async {
    try {
      final request = SendEmailRequest(checkCode: confirmationCoreController.text);
      await GrpcInfoService.client.checkEmailCode(request);
      onTapNextPage(context);
    } on GrpcError catch (e) {
      if (e.code != 1) showErrorDialog(context, "無効的なコードです。");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(
            imagePath: ImageConstant.imgWarning,
            height: mediaH / 20,
            width: mediaW / 10,
            alignment: Alignment.center,
          ),

          // Word
          content: Container(
            width: mediaW / 1.1,
            child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            CustomOutlinedButton(
              text: "OK",
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: mediaH / 100),
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 20),
        child: Column(
          children: [
            // Logo and Slogan
            SizedBox(height: mediaH / 15),
            CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4.5),
            CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3.5),
            SizedBox(height: mediaH / 50),

            // Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text("以下にコードを認証してください。", overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleOfUnderLogo),
            ),
            SizedBox(height: mediaH / 50),

            // Input
            CustomInputBar(titleName: "認証コード:", backendPart: _buildConfirmationCoreInput(context)),
            SizedBox(height: mediaH / 350),

            // reset password
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  onTapReturn(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: mediaW / 100),
                  child: Text("コードは届かない場合", style: CustomTextStyles.wordOnlySmallButton),
                ),
              ),
            ),
            SizedBox(height: mediaH / 50),

            // button
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  /// Era
  Widget _buildConfirmationCoreInput(BuildContext context) {
    return CustomInputFormBar(
      controller: confirmationCoreController,
      hintText: "423198",
      textInputType: TextInputType.text,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "認証",
      onPressed: () {
        checkCodeGrpcRequest(context);
      },
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fixInformation);
  }
}
