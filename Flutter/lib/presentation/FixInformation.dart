import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/widgets/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Word_button.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
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

  // upload and show image
  void _uploadPhotoToNewFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final directory = await getApplicationDocumentsDirectory();
      try {
        await for (var oldFile in Directory(directory.path).list()) {
          await oldFile.delete();
        }
        final newFilePath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
        await file.copy(newFilePath);

        setState(() {
          _imageFile = File(newFilePath);
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  // Grpc
  void fixInformationGrpcRequest(BuildContext context) async {
    if (fixFirstNameController.text.isEmpty) {
      showErrorDialog(context, "姓はまだ入力されていません");
    } else if (fixLastNameController.text.isEmpty) {
      showErrorDialog(context, "名はまだ入力されていません");
    } else if (fixBirthController.text.isEmpty) {
      showErrorDialog(context, "生年月日はまだ入力されていません");
    } else if (fixCountryController.text.isEmpty) {
      showErrorDialog(context, "国籍はまだ入力されていません");
    } else if (fixGenderController.text.isEmpty) {
      showErrorDialog(context, "性別はまだ入力されていません");
    } else if (fixBloodController.text.isEmpty) {
      showErrorDialog(context, "血液型はまだ入力されていません");
    } else if (confirm18Btn == false) {
      showErrorDialog(context, "１８歳以上のボタンを押してください");
    } else if (confirmAgreeBtn == false) {
      showErrorDialog(context, "同意のボタンを押してください");
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
        print(useridResponse.userID);
        // set user ID
        await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');

        saveImage(context);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data");
        throw Exception("Error occurred while fetching Fix.");
      }
    }
  }

  void saveImage(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      String? apiKeyU = await globalUserId.read(key: 'UserID');
      final createFolderPath = '/Users/cyrusman/Desktop/ProgrammingLearning/Apps/Flutter/userImage/u$apiKeyU';
      Directory(createFolderPath).createSync(recursive: true);
      String targetFilePath = path.join(createFolderPath, path.basename(_imageFile!.path));
      _imageFile!.copySync(targetFilePath);

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
      appBar: buildAppBar(context, "基本個人情報 - A", true),
      backgroundColor: appTheme.bgColor,
      // 鍵盤彈出後自動調節Size - 要test先知
      resizeToAvoidBottomInset: false,
      body: Container(
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
                child: Text("以下の項目は全部入力するのは必要です。", style: CustomTextStyles.msgWordOfMsgBox),
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
                : Icon(Icons.account_circle, size: mediaH / 6.5, color: appTheme.gray800),
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
    return CustomInputFormBar(controller: fixCountryController, hintText: "日本");
  }

  /// Gender
  Widget _buildfixGenderInput(BuildContext context) {
    return CustomInputFormBar(controller: fixGenderController, hintText: "男");
  }

  /// Blood
  Widget _buildfixBloodInput(BuildContext context) {
    return CustomInputFormBar(controller: fixBloodController, hintText: "O");
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
