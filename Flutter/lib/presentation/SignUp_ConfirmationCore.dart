import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_checkEmail.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
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
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      onTapNextButton(context);
    } else {
      print("checkcode:");
      print(confirmationCoreController.text);
    }
  }

  // Grpc
  void checkCodeGrpcRequest(BuildContext context) async {
    final request = SendEmailRequest(checkCode: confirmationCoreController.text);
    final response = await GrpcService.client.checkEmailCode(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
    } else {
      showErrorDialog(context, "Error: Empty response");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95, alignment: Alignment.center),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100, alignment: Alignment.center),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Title
              Text("以下にコードを認証してください。", style: theme.textTheme.headlineMedium),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Input
              CustomInputBar(titleName: "認証コード:", backendPart: _buildConfirmationCoreInput(context)),
              SizedBox(height: 2.v),
              // reset password
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    // checkcodeRequest(context);
                  },
                  child: Text("コードが届かない場合", style: CustomTextStyles.bodyMediumblack),
                ),
              ),
              SizedBox(height: 25.v),

              // button
              _buildNextPageButton(context),
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
      maxLines: 1,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      alignment: Alignment.center,
      height: 40,
      width: 95,
      text: "認証",
      buttonTextStyle: theme.textTheme.titleMedium!,
      onPressed: () {
        checkCodeGrpcRequest(context);
      },
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupPhoneoremailPartoneScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fixInformation);
  }
}
