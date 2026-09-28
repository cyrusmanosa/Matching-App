import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/client/login_rules.dart';
import 'package:dating_your_date/client/session_auth.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/presentation/NewPassword_Email_Setup.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/button/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:app_links/app_links.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  bool _shownSessionMessage = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initUniLinks(context);
    resumeSession();
  }

  Future<void> resumeSession() async {
    final sessionID = await globalSession.read(key: 'SessionId');
    if (sessionID == null || sessionID.isEmpty || !mounted) {
      return;
    }
    rememberSession(sessionID);
    try {
      final useridResponse = await GrpcInfoService.client.getUserID(GetUserIDRequest(sessionID: sessionID));
      await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');
      if (!mounted) {
        return;
      }
      getCanChangeGrpc(context);
    } on GrpcError catch (error) {
      if (isUnauthenticated(error)) {
        return;
      }
      await globalSession.delete(key: 'SessionId');
      await globalUserId.delete(key: 'UserID');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final message = ModalRoute.of(context)?.settings.arguments;
    if (!_shownSessionMessage && message is String && message.isNotEmpty) {
      _shownSessionMessage = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showErrorDialog(context, message);
        }
      });
    }
  }

  void initUniLinks(BuildContext context) async {
    final appLinks = AppLinks();
    try {
      final initialLink = await appLinks.getInitialLink();
      if (initialLink != null && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPasswordEmailSetup()),
        );
      }
    } catch (_) {}
    if (kIsWeb) {
      return;
    }
    appLinks.uriLinkStream.listen((Uri uri) {
      if (!context.mounted) {
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordEmailSetup()),
      );
    });
  }

  Future<void> continueWithSns(String provider, String serviceName) async {
    final emailController = TextEditingController();
    final email = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        final size = MediaQuery.of(dialogContext).size;
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          title: Text("$serviceNameで続ける", style: TextStyle(fontSize: size.width * 0.045)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "初めてなら登録へ進みます。パスワードで作ったアカウントは、ここからは入れません。",
                style: TextStyle(fontSize: size.width * 0.034),
              ),
              SizedBox(height: size.height * 0.015),
              TextField(
                controller: emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "メールアドレス"),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text("キャンセル")),
            TextButton(onPressed: () => Navigator.pop(dialogContext, emailController.text.trim()), child: const Text("続ける")),
          ],
        );
      },
    );
    emailController.dispose();
    if (!mounted || email == null) return;
    if (!emailIsValid(email)) {
      await showErrorDialog(context, "無効なメールアドレス");
      return;
    }

    var loading = false;
    try {
      showLoadDialog(context);
      loading = true;
      final loginResponse = await GrpcInfoService.client.loginUser(LoginUserRequest(email: email, password: snsPassword(provider)));
      if (!mounted) return;
      Navigator.pop(context);
      loading = false;
      if (isSignupSession(loginResponse.sessionsID)) {
        signupCode = signupCodeFromSession(loginResponse.sessionsID);
        await globalemail.write(key: "email", value: email);
        Navigator.pushNamed(context, AppRoutes.fixInformation);
        return;
      }
      await globalSession.write(key: "SessionId", value: loginResponse.sessionsID);
      rememberSession(loginResponse.sessionsID);
      final useridResponse = await GrpcInfoService.client.getUserID(GetUserIDRequest(sessionID: loginResponse.sessionsID));
      await globalUserId.write(key: "UserID", value: "${useridResponse.userID}");
      await globalemail.write(key: "email", value: loginResponse.email);
      if (!mounted) return;
      getCanChangeGrpc(context);
    } on GrpcError catch (error) {
      if (!mounted) return;
      if (loading) Navigator.pop(context);
      if (error.code == StatusCode.permissionDenied) {
        await showErrorDialog(context, "このメールアドレスはパスワードで登録されています。上の欄からログインしてください。");
        return;
      }
      if (error.code == StatusCode.failedPrecondition) {
        await showErrorDialog(context, "このアカウントは別のサービスで登録されています。");
        return;
      }
      await showErrorDialog(context, "SNSでのログインに失敗しました。");
    }
  }

  void loginGrpcUser(BuildContext context) async {
    try {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      final loginRequest = LoginUserRequest(email: emailController.text, password: passwordController.text);
      final loginResponse = await GrpcInfoService.client.loginUser(loginRequest);
      await globalSession.write(key: 'SessionId', value: loginResponse.sessionsID);
      rememberSession(loginResponse.sessionsID);
      // take user id
      final useridRequest = GetUserIDRequest(sessionID: loginResponse.sessionsID);
      final useridResponse = await GrpcInfoService.client.getUserID(useridRequest);
      await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');
      getCanChangeGrpc(context);
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "メールアドレスまたはパスワードに誤りがあります。");
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
                  CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 4),
                  CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
                  SizedBox(height: mediaH / 35),

                  // ID
                  CustomInputBar(titleName: "メールアドレス:", backendPart: _buildEmailInput()),
                  SizedBox(height: mediaH / 80),

                  // Password
                  CustomInputBar(titleName: "パスワード:", backendPart: _buildPasswordInput()),
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
                  _buildLoginButton(),
                  SizedBox(height: mediaH / 50),

                  // or
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // line 1
                      Padding(padding: EdgeInsets.all(mediaW / 50), child: SizedBox(width: mediaW / 3.5, child: Divider())),
                      // Word
                      Text("または", style: theme.textTheme.titleMedium),
                      // line 2
                      Padding(padding: EdgeInsets.all(mediaW / 50), child: SizedBox(width: mediaW / 3.5, child: Divider())),
                    ],
                  ),
                  SizedBox(height: mediaH / 35),
                  _buildSignUpPart(context, mediaH),
                  SizedBox(height: mediaH / 35),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Email Input Backend
  Widget _buildEmailInput() {
    return CustomInputFormBar(
      autofocus: true,
      controller: emailController,
      textInputType: TextInputType.emailAddress,
      hintText: "example@email.com",
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// Password Input Backend
  Widget _buildPasswordInput() {
    return CustomInputFormBar(
      controller: passwordController,
      hintText: "Secret",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: passwordVisible ? false : true,
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
  Widget _buildLoginButton() {
    return CustomOutlinedButton(
      text: "ログイン",
      onPressed: () {
        loginGrpcUser(context);
      },
    );
  }

  Widget _snsIcon(String imagePath, double mediaH) {
    final size = mediaH * 0.028;
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(right: size * 0.45),
      alignment: Alignment.center,
      child: CustomImageView(imagePath: imagePath, width: size, height: size, fit: BoxFit.contain),
    );
  }

  /// SignUp Part
  Widget _buildSignUpPart(BuildContext context, double mediaH) {
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
          text: "フェイスブックで続ける",
          leftIcon: _snsIcon(ImageConstant.imgFacebook, mediaH),
          buttonStyle: CustomButtonStyles.fillBlue,
          onPressed: () {
            continueWithSns("facebook", "Facebook");
          },
        ),
        SizedBox(height: mediaH / 50),

        // SignUp of Twitter
        CustomElevatedButton(
          text: "ツイッターで続ける",
          leftIcon: _snsIcon(ImageConstant.imgClose, mediaH),
          buttonStyle: CustomButtonStyles.fillDarkgrey,
          onPressed: () {
            continueWithSns("twitter", "X");
          },
        ),
        SizedBox(height: mediaH / 50),

        // SignUp of Google
        CustomElevatedButton(
          text: "グーグルで続ける",
          leftIcon: _snsIcon(ImageConstant.imgGoogle, mediaH),
          buttonStyle: CustomButtonStyles.outlineGoogleButton,
          buttonTextStyle: theme.textTheme.headlineMedium?.copyWith(color: appTheme.black),
          onPressed: () {
            continueWithSns("google", "Google");
          },
        ),
      ],
    );
  }
}
