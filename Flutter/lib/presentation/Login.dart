// ignore: avoid_web_libraries_in_flutter
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// HTTP
  void loginHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/UserLogin";
    var requestBody = {"Email": emailController.text, "Password": passwordController.text};
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapLoginButton(context);
    }
  }

// Grpc
  void loginUser(BuildContext context) async {
    final request = LoginUserRequest(email: emailController.text, password: passwordController.text);
    try {
      final loginResponse = await GrpcInfoService.client.loginUser(request);
      globalSessionID = loginResponse.sessionsID;
      print(_formKey);
      onTapLoginButton(context);
    } on GrpcError catch (e) {
      showErrorDialog(context, "Email or Password have a ${e.codeName}");
    }
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

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        mediaQueryData = MediaQuery.of(context);
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 10),
                child: Column(
                  children: [
                    // Logo and Slogan
                    SizedBox(height: mediaQueryData.size.height / 15),
                    CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaQueryData.size.width / 3.5),
                    CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaQueryData.size.width / 3),
                    SizedBox(height: mediaQueryData.size.height / 35),

                    // ID
                    CustomInputBar(titleName: "ユーザーID:", backendPart: _buildEmailInput(context)),
                    SizedBox(height: mediaQueryData.size.height / 80),

                    // Password
                    CustomInputBar(titleName: "パスワード:", backendPart: _buildPasswordInput(context)),
                    SizedBox(height: mediaQueryData.size.height / 350),

                    // reset password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          onTapPasswordResetEmail(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: mediaQueryData.size.width / 100),
                          child: Text("パスワードを忘れた場合", style: CustomTextStyles.wordOnlySmallButton),
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height / 50),

                    // login button
                    _buildNextPageButton(context),
                    SizedBox(height: mediaQueryData.size.height / 35),

                    // or
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // line 1
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          child: SizedBox(width: mediaQueryData.size.width / 3.5, child: Divider()),
                        ),
                        // Word
                        Text("または", style: theme.textTheme.titleMedium),
                        // line 2
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: SizedBox(width: mediaQueryData.size.width / 3.5, child: Divider()),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQueryData.size.height / 35),

                    // SignUp of Email
                    CustomElevatedButton(
                      text: "メールアドレスで登録",
                      buttonStyle: CustomButtonStyles.fillPink,
                      buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                      onPressed: () {
                        onTapEmailSignUpButton(context);
                      },
                    ),
                    SizedBox(height: mediaQueryData.size.height / 50),

                    // SignUp of Facebook
                    CustomElevatedButton(
                      text: "フェイスブックで続ける",
                      leftIcon: Container(
                        margin: EdgeInsets.only(left: mediaQueryData.size.width / 20, right: mediaQueryData.size.width / 15),
                        child: CustomImageView(imagePath: ImageConstant.imgLogosfacebook, width: mediaQueryData.size.width / 23),
                      ),
                      buttonStyle: CustomButtonStyles.fillBlue,
                      buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                    ),
                    SizedBox(height: mediaQueryData.size.height / 50),

                    // SignUp of Twitter
                    CustomElevatedButton(
                      text: "ツイッターで続ける",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: mediaQueryData.size.width / 15),
                        child: CustomImageView(imagePath: ImageConstant.imgClose, width: mediaQueryData.size.width / 14),
                      ),
                      buttonStyle: CustomButtonStyles.fillDarkGray,
                      buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                    ),
                    SizedBox(height: mediaQueryData.size.height / 50),

                    // SignUp of Google
                    CustomElevatedButton(
                      text: "グーグルで続ける",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: mediaQueryData.size.width / 15),
                        child: CustomImageView(imagePath: ImageConstant.imgDevicongoogle, width: mediaQueryData.size.width / 13),
                      ),
                      buttonStyle: CustomButtonStyles.outlineGoogleButton,
                      buttonTextStyle: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Email Input Backend
  Widget _buildEmailInput(BuildContext context) {
    return CustomInputFormBar(
      autofocus: true,
      controller: emailController,
      textInputType: TextInputType.emailAddress,
      hintText: "example@email.com",
      maxLines: 1,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// Password Input Backend
  Widget _buildPasswordInput(BuildContext context) {
    return CustomInputFormBar(
      controller: passwordController,
      hintText: "Secret",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: passwordVisible ? false : true,
      maxLines: 1,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
      suffix: IconButton(
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        color: appTheme.gray500,
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "ログイン",
      onPressed: () {
        loginUser(context);
      },
    );
  }

  /// Login
  onTapLoginButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.containerScreen);
  }

  /// PasswordResetEmail
  onTapPasswordResetEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordResetEmail);
  }

  /// Email to SignUp
  onTapEmailSignUpButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.emailConfirmation);
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }
}
