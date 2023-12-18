import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/pb/rpc_checkEmail.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore_for_file: must_be_immutable
class EmailConfirmation extends StatelessWidget {
  EmailConfirmation({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  TextEditingController emailController = TextEditingController();

  // Http
  void signUpHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/SignUpEmail";
    var requestBody = {"email": emailController.text};
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      onTapNextButton(context);
    } else {
      print("email: ${emailController.text}");
    }
  }

// Grpc
  void signUpGrpcRequest(BuildContext context) async {
    final request = CheckEmailRequest(email: emailController.text);
    final response = await GrpcService.client.checkEmail(request);
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _key,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
            child: Column(
              children: [
                // Logo
                CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
                SizedBox(height: 1.v),

                // slogan
                CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
                SizedBox(height: mediaQueryData.size.height / 50),

                // 手続き
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "この手続きは1回のみで、以降表示されません",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumblack,
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // input
                CustomInputBar(titleName: "メールアドレス", backendPart: _buildEmailInputSection(context)),
                SizedBox(height: mediaQueryData.size.height / 150),

                // information note
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(
                      "・メールアドレスの受信確認が必須です。\n・ご登録済みのお客様は受信確認をお願いしております。",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumblack,
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height / 50),

                // send button
                _buildNextPageButton(context),
                SizedBox(height: mediaQueryData.size.height / 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInputSection(BuildContext context) {
    return CustomInputFormBar(
      controller: emailController,
      hintText: "  example@email.com",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      maxLines: 1,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "送信する",
      buttonTextStyle: theme.textTheme.titleMedium!,
      onPressed: () {
        signUpGrpcRequest(context);
      },
    );
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.confirmationCore);
  }
}
