import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/presentation/NewPassword_Email_Setup.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/button/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:uni_links/uni_links.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initUniLinks(context);
  }

  void initUniLinks(BuildContext context) async {
    await getInitialLink();
    Uri? initialLink = await getInitialUri();
    if (initialLink != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordEmailSetup()),
      );
    }
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPasswordEmailSetup()),
        );
      }
    });
  }

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
      final useridRequest = GetUserIDRequest(sessionID: loginResponse.sessionsID);
      final useridResponse = await GrpcInfoService.client.getUserID(useridRequest);
      await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');
      getCanChangeGrpc(context);
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "メールアドレスまたはパスワードに誤りがあります。");
      throw Exception("ログインの取得中にエラーが発生しました。");
    }
  }

  /// check can change
  Future<void> getCanChangeGrpc(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final userid = int.tryParse(apiKeyU!);
      final req = GetCanChangeRequest(sessionID: apiKeyS, userID: userid);
      await GrpcInfoService.client.getCanChange(req);
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.pushNamed(context, AppRoutes.containerScreen);
    } on GrpcError {
      await showErrorDialog(context, "エラー：必要なデータはまだ入力していません");
      Navigator.pushNamed(context, AppRoutes.canChangeInformation_1);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark, toolbarHeight: 0),
            backgroundColor: appTheme.bgColor,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
              child: Column(
                children: [
                  // Logo and Slogan
                  SizedBox(height: mediaH / 35),
                  CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
                  CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
                  SizedBox(height: mediaH / 35),

                  // ID
                  CustomInputBar(titleName: "メールアドレス:", backendPart: _buildEmailInput(context)),
                  SizedBox(height: mediaH / 80),

                  // Password
                  CustomInputBar(titleName: "パスワード:", backendPart: _buildPasswordInput(context)),
                  SizedBox(height: mediaH / 350),

                  // reset password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.passwordResetEmail);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: mediaW / 100),
                        child: Text("パスワードを忘れた場合", style: CustomTextStyles.wordOnlySmallButton),
                      ),
                    ),
                  ),
                  SizedBox(height: mediaH / 50),

                  // login button
                  _buildLoginButton(context),
                  SizedBox(height: mediaH / 50),

                  // or
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // line 1
                      Padding(padding: EdgeInsets.all(10), child: SizedBox(width: mediaW / 3.5, child: Divider())),
                      // Word
                      Text("または", style: theme.textTheme.titleMedium),
                      // line 2
                      Padding(padding: EdgeInsets.all(10), child: SizedBox(width: mediaW / 3.5, child: Divider())),
                    ],
                  ),
                  SizedBox(height: mediaH / 35),
                  _buildSignUpPart(context, mediaH, mediaW),
                ],
              ),
            ),
          );
        },
      ),
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
        color: appTheme.grey500,
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      ),
    );
  }

  /// Login Button
  Widget _buildLoginButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "ログイン",
      onPressed: () {
        loginGrpcUser(context);
      },
    );
  }

  /// SignUp Part
  Widget _buildSignUpPart(BuildContext context, double mediaH, double mediaW) {
    return Column(
      children: [
        // SignUp of Email
        CustomElevatedButton(
          text: "メールアドレスで登録",
          buttonStyle: CustomButtonStyles.fillPink,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.emailConfirmation);
          },
        ),
        SizedBox(height: mediaH / 50),

        // SignUp of Facebook
        CustomElevatedButton(
          isDisabled: true,
          text: "フェイスブックで続ける",
          leftIcon: Container(
            margin: EdgeInsets.only(left: mediaW / 20, right: mediaW / 15),
            child: CustomImageView(
              imagePath: ImageConstant.imgLogosfacebook,
              width: mediaW / 23,
              color: Colors.grey,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillBlue,
        ),
        SizedBox(height: mediaH / 50),

        // SignUp of Twitter
        CustomElevatedButton(
          isDisabled: true,
          text: "ツイッターで続ける",
          leftIcon: Container(
            margin: EdgeInsets.only(right: mediaW / 15),
            child: CustomImageView(
              imagePath: ImageConstant.imgClose,
              width: mediaW / 14,
              color: Colors.grey,
            ),
          ),
          buttonStyle: CustomButtonStyles.fillDarkgrey,
        ),
        SizedBox(height: mediaH / 50),

        // SignUp of Google
        CustomElevatedButton(
          isDisabled: true,
          text: "グーグルで続ける",
          leftIcon: Container(
            margin: EdgeInsets.only(right: mediaW / 13),
            // child: CustomImageView(imagePath: ImageConstant.imgDevicongoogle, width: mediaW / 13, color: Colors.grey),
          ),
          // buttonStyle: CustomButtonStyles.outlineGoogleButton,
          // buttonTextStyle: theme.textTheme.displaySmall,
        ),
      ],
    );
  }
}
