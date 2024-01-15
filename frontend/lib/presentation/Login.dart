import 'dart:io';

import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_changeTarget.pb.dart';
import 'package:dating_your_date/pb/rpc_chatRecord.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_login.pb.dart';
import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/pb/targetList.pb.dart';
import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/button/custom_elevated_button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// -------------------------Home--------------------------------
  Targetlist? allTarget;
  List<int> allTargetId = [];
  List<File> allTargetImage = [];
  List<Fix> allTargetFix = List<Fix>.filled(3, Fix());
  List<CanChange> allTargetCanChange = List<CanChange>.filled(3, CanChange());

  /// -------------------------Home--------------------------------
  /// ------------------------Profile------------------------------
  File myImg1 = File('');
  File myImg2 = File('');
  File myImg3 = File('');
  File myImg4 = File('');
  File myImg5 = File('');
  List<File> allMyImg = [];

  String? send;
  String? changeTime;
  CanChange? cCData = CanChange();
  Fix? myFixData = Fix();

  /// ------------------------Profile------------------------------

  /// all Manager
  Future<void> fetchData(BuildContext context) async {
    getTargetListGrpc(context);
    getTargetImageGrpc(context);
    if (allTarget != null) {
      allTargetId = [allTarget!.target1ID, allTarget!.target2ID, allTarget!.target3ID];
    }
    getTargetDataGrpc(context, allTargetId);
    getChangeGrpcRequest(context);
    await getImagesGrpcRequest(context);

    allMyImg = [myImg1, myImg2, myImg3, myImg4, myImg5];

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContainerScreen(
          number: 0,
          page: [
            Home(
              allTargetImage: allTargetImage,
              allTargetId: allTargetId,
              allTargetFix: allTargetFix,
              allTargetCanChange: allTargetCanChange,
            ),
            Target(head: "head"),
            Chat(),
            Profile(
              send: send,
              changeTime: changeTime,
              allMyImg: allMyImg,
            ),
          ],
        ),
      ),
    );
  }

  /// get myself Image
  Future<void> getImagesGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      // image
      final imgRequest = GetImagesRequest(sessionID: apiKeyS, userID: userid);
      final imgResponse = await GrpcInfoService.client.getImages(imgRequest);
      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      if (imgResponse.img.img1.isNotEmpty) {
        String filePath1 = '${documentsDirectory.path}/img1.bin';
        File file1 = File(filePath1);
        Uint8List bytes1 = Uint8List.fromList(imgResponse.img.img1);
        await file1.writeAsBytes(bytes1);
        setState(() {
          myImg1 = file1;
        });
      }

      if (imgResponse.img.img2.isNotEmpty) {
        String filePath2 = '${documentsDirectory.path}/img2.bin';
        File file2 = File(filePath2);
        Uint8List bytes2 = Uint8List.fromList(imgResponse.img.img2);
        await file2.writeAsBytes(bytes2);
        setState(() {
          myImg2 = file2;
        });
      }

      if (imgResponse.img.img3.isNotEmpty) {
        String filePath3 = '${documentsDirectory.path}/img3.bin';
        File file3 = File(filePath3);
        Uint8List bytes3 = Uint8List.fromList(imgResponse.img.img3);
        await file3.writeAsBytes(bytes3);
        setState(() {
          myImg3 = file3;
        });
      }

      if (imgResponse.img.img4.isNotEmpty) {
        String filePath4 = '${documentsDirectory.path}/img4.bin';
        File file4 = File(filePath4);
        Uint8List bytes4 = Uint8List.fromList(imgResponse.img.img4);
        await file4.writeAsBytes(bytes4);
        setState(() {
          myImg4 = file4;
        });
      }

      if (imgResponse.img.img5.isNotEmpty) {
        String filePath5 = '${documentsDirectory.path}/img5.bin';
        File file5 = File(filePath5);
        Uint8List bytes5 = Uint8List.fromList(imgResponse.img.img5);
        await file5.writeAsBytes(bytes5);
        setState(() {
          myImg5 = file5;
        });
      }
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Image!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  /// get Data
  void getChangeGrpcRequest(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    try {
      final changeRequest = GetChangeTargetRequest(sessionID: apiKeyS);
      final changeResponse = await GrpcInfoService.client.getChangeTarget(changeRequest);
      setState(() {
        changeTime = changeResponse.ct.frequency.toString();
      });
    } on GrpcError catch (e) {
      if (e.code == 13) {
        changeTime = "0";
      } else {
        showErrorDialog(context, "Error: validatable input UserId in ChangeTarget! $e");
        throw Exception("Error occurred while fetching canChangeInfo.");
      }
    }
    try {
      final sendRequest = GetChatRowRequest(userID: userid);
      final sendResponse = await GrpcChatService.client.getChatRow(sendRequest);
      setState(() {
        send = sendResponse.row.toString();
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable input UserId in Chat Record!");
      throw Exception("Error occurred while fetching canChangeInfo.");
    }
  }

  /// get target list
  void getTargetListGrpc(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final tlRequest = GetTargetListRequest(sessionID: apiKeyS);
      final tlResponse = await GrpcInfoService.client.getTargetList(tlRequest);
      setState(() {
        allTarget = tlResponse.tl;
      });
    } on GrpcError {
      showErrorDialog(context, "Error: validatable get Target List !");
      throw Exception("Error occurred while fetching Target List.");
    }
  }

  /// get Target icon
  void getTargetImageGrpc(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    Uint8List imgBytes = Uint8List(0);
    for (int i = 0; i < 3; i++) {
      int targetID;
      switch (i) {
        case 0:
          if (allTarget!.target1ID != 0) {
            targetID = allTarget!.target1ID;
            imgBytes = Uint8List.fromList(
              (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img1,
            );
          }
          break;
        case 1:
          if (allTarget!.target2ID != 0) {
            targetID = allTarget!.target2ID;
            imgBytes = Uint8List.fromList(
                (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img1);
          }
          break;
        case 2:
          if (allTarget!.target3ID != 0) {
            targetID = allTarget!.target3ID;
            imgBytes = Uint8List.fromList(
                (await GrpcInfoService.client.getImages(GetImagesRequest(sessionID: apiKeyS, userID: targetID))).img.img1);
          }
          break;
      }

      String filePath = '${documentsDirectory.path}/img$i.bin';
      File file = File(filePath);
      await file.writeAsBytes(imgBytes);
      setState(() {
        allTargetImage.add(file);
      });
    }
  }

  /// get Target Fix
  void getTargetDataGrpc(BuildContext context, List<int> allTargetId) async {
    for (int i = 0; i < allTargetId.length; i++) {
      if (allTargetId[i] != 0) {
        try {
          String? apiKeyS = await globalSession.read(key: 'SessionId');
          final request = GetFixRequest(sessionID: apiKeyS, userID: allTargetId[i]);
          final response = await GrpcInfoService.client.getFix(request);
          setState(() {
            allTargetFix[i] = response.fix;
          });
        } on GrpcError {
          showErrorDialog(context, "Error: validatable get Can Change!");
          throw Exception("Error occurred while fetching Can Change.");
        }

        try {
          String? apiKeyS = await globalSession.read(key: 'SessionId');
          final request = GetCanChangeRequest(sessionID: apiKeyS, userID: allTargetId[i]);
          final response = await GrpcInfoService.client.getCanChange(request);
          setState(() {
            allTargetCanChange[i] = response.canChangeInfo;
          });
        } on GrpcError {
          showErrorDialog(context, "Error: validatable get Can Change!");
          throw Exception("Error occurred while fetching Can Change.");
        }
      }
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

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
    } on GrpcError {
      Navigator.pop(context);
      showErrorDialog(context, "Email or Password have a error.");
      throw Exception("Error occurred while fetching Login.");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark, toolbarHeight: 0),
          backgroundColor: appTheme.bgColor,
          // 鍵盤彈出後自動調節Size - 要test先知
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
            child: Column(
              children: [
                // Logo and Slogan
                SizedBox(height: mediaH / 25),
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
                _buildLoginButton(context),
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
                _buildSignUpPart(context, mediaH, mediaW),
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

  /// Login Button
  Widget _buildLoginButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "ログイン",
      onPressed: () {
        // loginGrpcUser(context);
        fetchData(context);
        // Navigator.pushNamed(context, AppRoutes.containerScreen);
      },
    );
  }

  /// PasswordResetEmail
  onTapPasswordResetEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordResetEmail);
  }

  /// SignUp Part
  Widget _buildSignUpPart(BuildContext context, double mediaH, double mediaW) {
    return Column(
      children: [
        // SignUp of Email
        CustomElevatedButton(
          text: "メールアドレスで登録",
          buttonStyle: CustomButtonStyles.fillPink,
          buttonTextStyle: CustomTextStyles.outlineWhiteWordButton,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.emailConfirmation);
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
    );
  }
}
