import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Word_button.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';

import 'package:path_provider/path_provider.dart';

class FixInformation extends StatefulWidget {
  FixInformation({Key? key}) : super(key: key);

  @override
  _FixInformationState createState() => _FixInformationState();
}

class _FixInformationState extends State<FixInformation> {
  TextEditingController fixLastNameController = TextEditingController();
  TextEditingController fixFirstNameController = TextEditingController();
  TextEditingController fixBirthController = TextEditingController();
  TextEditingController fixCountryController = TextEditingController();
  TextEditingController fixGenderController = TextEditingController();
  TextEditingController fixBloodController = TextEditingController();

  String? oldPath;
  File? _imageFile;
  bool confirm18Btn = false;
  bool confirmAgreeBtn = false;

  void _uploadPhotoToNewFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);

      setState(() {
        _imageFile = file;
      });
    }
  }

  // Grpc
  void fixInformationGrpcRequest(BuildContext context) async {
    if (fixFirstNameController.text.isEmpty) {
      await showErrorDialog(context, "姓はまだ入力されていません");
    } else if (fixLastNameController.text.isEmpty) {
      await showErrorDialog(context, "名はまだ入力されていません");
    } else if (fixBirthController.text.isEmpty) {
      await showErrorDialog(context, "生年月日はまだ入力されていません");
    } else if (fixCountryController.text.isEmpty) {
      await showErrorDialog(context, "国籍はまだ入力されていません");
    } else if (fixGenderController.text.isEmpty) {
      await showErrorDialog(context, "性別はまだ入力されていません");
    } else if (fixBloodController.text.isEmpty) {
      await showErrorDialog(context, "血液型はまだ入力されていません");
    } else if (confirm18Btn == false) {
      await showErrorDialog(context, "１８歳以上のボタンを押してください");
    } else if (confirmAgreeBtn == false) {
      await showErrorDialog(context, "同意のボタンを押してください");
    } else {
      try {
        setState(() {
          showLoadDialog(context);
        });
        final request = CreateFixRequest(
          firstName: fixFirstNameController.text,
          lastName: fixLastNameController.text,
          birth: fixBirthController.text,
          country: fixCountryController.text,
          gender: fixGenderController.text,
          blood: fixBloodController.text,
        );
        final response = await GrpcInfoService.client.createFix(request);
        // set session ID
        await globalSession.write(key: 'SessionId', value: response.sessionsID);
        // take user id
        final useridRequest = GetUserIDRequest(sessionID: response.sessionsID);
        final useridResponse = await GrpcInfoService.client.getUserID(useridRequest);
        // set user ID
        await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');

        saveImage(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：検証可能な入力データ");
        throw Exception("データの送信中にエラーが発生しました。");
      }
    }
  }

  void saveImage(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      Uint8List bytes = await _imageFile!.readAsBytes();
      List<int> img = bytes.toList();
      final request = CreateImagesRequest(sessionID: apiKeyS, img1: img, img2: null, img3: null, img4: null, img5: null);
      await GrpcInfoService.client.createImages(request);
      onTapNextPage(context);
    } on GrpcError catch (e) {
      Navigator.pop(context);
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: buildAppBar(context, "マイプロフィール", true),
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
            child: Column(
              children: [
                // image
                _buildImages(context, mediaH),
                SizedBox(height: mediaH / 50),

                // msg
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("＊マイプロフィールの資料は一度入力されますと", style: CustomTextStyles.titleOfUnderLogo),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("　変更することができません。", style: CustomTextStyles.titleOfUnderLogo),
                ),
                SizedBox(height: mediaH / 75),

                // Last name
                CustomInputBar(titleName: "姓:", backendPart: _buildfixLastNameInput(context)),
                SizedBox(height: mediaH / 50),

                // First name
                CustomInputBar(titleName: "名:", backendPart: _buildfixFirstNameInput(context)),
                SizedBox(height: mediaH / 50),

                // Birth
                CustomInputBar(titleName: "生年月日:", backendPart: _buildfixBirthInput(context)),
                SizedBox(height: mediaH / 50),

                // Country
                CustomInputBar(titleName: "国籍:", backendPart: _buildfixCountryInput(context)),
                SizedBox(height: mediaH / 50),

                // Gender
                CustomInputBar(titleName: "性別:", backendPart: _buildfixGenderInput(context)),
                SizedBox(height: mediaH / 50),

                // 血液型
                CustomInputBar(titleName: "血液型:", backendPart: _buildfixBloodInput(context)),
                SizedBox(height: mediaH / 50),

                // 18
                InkWell(
                  onTap: () {
                    setState(() {
                      confirm18Btn = !confirm18Btn;
                    });
                  },
                  child: WordButton(msg: "満18歳以上の独身であることを誓約します", mediaH: mediaH, mediaW: mediaW, boolbtn: confirm18Btn),
                ),
                SizedBox(height: mediaH / 150),

                // Agree
                InkWell(
                  onTap: () {
                    setState(() {
                      confirmAgreeBtn = !confirmAgreeBtn;
                    });
                  },
                  child: WordButton(msg: "全ての規約に同意します", mediaH: mediaH, mediaW: mediaW, boolbtn: confirmAgreeBtn),
                ),
                SizedBox(height: mediaH / 25),

                // Button
                _buildNextButton(context),
                SizedBox(height: mediaH / 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// image
  Widget _buildImages(BuildContext context, double mediaH) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _uploadPhotoToNewFile();
            },
            icon: _imageFile != null
                ? Container(width: mediaH / 6.5, height: mediaH / 6.5, child: ClipOval(child: Image.file(_imageFile!, fit: BoxFit.cover)))
                : Icon(Icons.account_circle, size: mediaH / 6.5, color: appTheme.grey800),
          ),
        ],
      ),
    );
  }

  /// Last Name
  Widget _buildfixLastNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixLastNameController,
      hintText: "山崎",
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// First Name
  Widget _buildfixFirstNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixFirstNameController,
      hintText: "泰一",
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
    );
  }

  /// Birth
  Widget _buildfixBirthInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixBirthController,
      hintText: "1982−03−12",
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1923),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.dark().copyWith(primary: appTheme.white, surface: appTheme.grey500),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          fixBirthController.text = formattedDate;
        }
      },
    );
  }

  /// Country
  Widget _buildfixCountryInput(BuildContext context) {
    final keys = asiaCities.keys;
    return CustomDropDownBar(controller: fixCountryController, hintText: asiaCities.keys.first, itemArray: keys.toList());
  }

  /// Gender
  Widget _buildfixGenderInput(BuildContext context) {
    return CustomDropDownBar(controller: fixGenderController, hintText: genderList[0], itemArray: genderList);
  }

  /// Blood
  Widget _buildfixBloodInput(BuildContext context) {
    return CustomDropDownBar(controller: fixBloodController, hintText: blood[0], itemArray: blood);
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "次へ",
      onPressed: () {
        fixInformationGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordSetup);
  }
}
