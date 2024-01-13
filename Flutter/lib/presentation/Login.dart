import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:grpc/grpc.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Grpc
  void loginGrpcUser(BuildContext context) async {
    try {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      final loginRequest = LoginUserRequest(email: emailController.text, password: passwordController.text);
      final loginResponse = await GrpcInfoService.client.loginUser(loginRequest);
      await globalSession.write(key: 'SessionId', value: loginResponse.sessionsID);
      // take user id
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final useridRequest = GetUserIDRequest(sessionID: apiKeyS);
      final useridResponse = await GrpcInfoService.client.getUserID(useridRequest);
      await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');
      onTapLoginButton(context);
    } on GrpcError {
      Navigator.pop(context);
      showErrorDialog(context, "Email or Password have a error.", false);
      throw Exception("Error occurred while fetching Login.");
    }
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: appTheme.white,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
            child: Column(
              children: [
                // Logo and Slogan
                SizedBox(height: mediaH / 10),
                CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
                CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
                SizedBox(height: mediaH / 35),

                // ID
                CustomInputBar(titleName: "ユーザーID:", backendPart: _buildEmailInput(context)),
                SizedBox(height: mediaH / 80),

                // Password
                CustomInputBar(titleName: "パスワード:", backendPart: _buildPasswordInput(context)),
                SizedBox(height: mediaH / 350),

                // reset password
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      onTapPasswordResetEmail(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: mediaW / 100),
                      child: Text("パスワードを忘れた場合", style: CustomTextStyles.wordOnlySmallButton),
                    ),
                  ),
                ),
                SizedBox(height: mediaH / 50),

                // login button
                _buildNextButton(context),
                SizedBox(height: mediaH / 35),

                // or
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // line 1
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: SizedBox(width: mediaW / 3.5, child: Divider()),
                    ),
                    // Word
                    Text("または", style: theme.textTheme.titleMedium),
                    // line 2
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: SizedBox(width: mediaW / 3.5, child: Divider()),
                    ),
                  ],
                ),
                SizedBox(height: mediaH / 35),

                // SignUp of Email
                CustomElevatedButton(
                  text: "メールアドレスで登録",
                  buttonStyle: CustomButtonStyles.fillPink,
                  buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                  onPressed: () {
                    onTapEmailSignUpButton(context);
                  },
                ),
                SizedBox(height: mediaH / 50),

                // SignUp of Facebook
                CustomElevatedButton(
                  text: "フェイスブックで続ける",
                  leftIcon: Container(
                    margin: EdgeInsets.only(left: mediaW / 20, right: mediaW / 15),
                    child: CustomImageView(imagePath: ImageConstant.imgLogosfacebook, width: mediaW / 23),
                  ),
                  buttonStyle: CustomButtonStyles.fillBlue,
                  buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                ),
                SizedBox(height: mediaH / 50),

                // SignUp of Twitter
                CustomElevatedButton(
                  text: "ツイッターで続ける",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: mediaW / 15),
                    child: CustomImageView(imagePath: ImageConstant.imgClose, width: mediaW / 14),
                  ),
                  buttonStyle: CustomButtonStyles.fillDarkGray,
                  buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
                ),
                SizedBox(height: mediaH / 50),

                // SignUp of Google
                CustomElevatedButton(
                  text: "グーグルで続ける",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: mediaW / 15),
                    child: CustomImageView(imagePath: ImageConstant.imgDevicongoogle, width: mediaW / 13),
                  ),
                  buttonStyle: CustomButtonStyles.outlineGoogleButton,
                  buttonTextStyle: theme.textTheme.displaySmall,
                ),
              ],
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
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "ログイン",
      onPressed: () {
        loginGrpcUser(context);
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
}
