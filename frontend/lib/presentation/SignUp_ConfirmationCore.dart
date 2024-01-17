import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_checkEmail.pb.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class ConfirmationCore extends StatefulWidget {
  ConfirmationCore({Key? key}) : super(key: key);
  @override
  _ConfirmationCoreState createState() => _ConfirmationCoreState();
}

class _ConfirmationCoreState extends State<ConfirmationCore> {
  TextEditingController confirmationCoreController = TextEditingController();

  // Grpc
  void checkCodeGrpcRequest(BuildContext context) async {
    try {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      final request = SendEmailRequest(checkCode: confirmationCoreController.text);
      await GrpcInfoService.client.checkEmailCode(request);
      onTapNextPage(context);
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "コードにエラーがあります。");
      throw Exception("チェックコードの確認中にエラーが発生しました。");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "", true),
      backgroundColor: appTheme.bgColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
          child: Column(
            children: [
              // Logo and Slogan
              CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4.5),
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3.5),
              SizedBox(height: mediaH / 30),

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
    Navigator.popUntil(context, ModalRoute.withName(AppRoutes.emailConfirmation));
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fixInformation);
  }
}
