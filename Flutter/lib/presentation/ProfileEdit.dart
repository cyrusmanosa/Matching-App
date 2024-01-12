import 'dart:io';
import 'dart:typed_data';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key, this.canData, this.imgIconPath}) : super(key: key);
  final CanChange? canData;
  final File? imgIconPath;

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController updateNickNameController = TextEditingController();
  TextEditingController updateCityController = TextEditingController();
  TextEditingController updateSexualController = TextEditingController();
  TextEditingController updateHeightController = TextEditingController();
  TextEditingController updateWeightController = TextEditingController();
  TextEditingController updateEducationController = TextEditingController();
  TextEditingController updateJobController = TextEditingController();
  TextEditingController updateSpeakLanguageController = TextEditingController();
  TextEditingController updateAnnualSalaryController = TextEditingController();
  TextEditingController updateSociabilityController = TextEditingController();
  TextEditingController updateReligiousController = TextEditingController();
  TextEditingController updateIntroduceController = TextEditingController();

  String? oldPath;
  File? _oldimageFile;
  File? _newimageFile;

  @override
  void initState() {
    super.initState();
    updateNickNameController = TextEditingController(text: widget.canData?.nickName);
    updateCityController = TextEditingController(text: widget.canData?.city);
    updateSexualController = TextEditingController(text: widget.canData?.sexual);
    updateHeightController = TextEditingController(text: widget.canData?.height.toString());
    updateWeightController = TextEditingController(text: widget.canData?.weight.toString());
    updateEducationController = TextEditingController(text: widget.canData?.education);
    updateSpeakLanguageController = TextEditingController(text: widget.canData?.speaklanguage);
    updateJobController = TextEditingController(text: widget.canData?.job);
    updateAnnualSalaryController = TextEditingController(text: widget.canData?.annualSalary.toString());
    updateSociabilityController = TextEditingController(text: widget.canData?.sociability);
    updateReligiousController = TextEditingController(text: widget.canData?.religious);
    updateIntroduceController = TextEditingController(text: widget.canData?.introduce);
    _oldimageFile = widget.imgIconPath!;
    _newimageFile = widget.imgIconPath!;
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

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
        oldPath = directory.path;
        final newFilePath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
        await file.copy(newFilePath);
        setState(() {
          _oldimageFile = File(newFilePath);
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  void updateImage(BuildContext context) async {
    if (_newimageFile != _oldimageFile)
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        String? apiKeyU = await globalUserId.read(key: 'UserID');

        final createFolderPath = '/Users/cyrusman/Desktop/ProgrammingLearning/Apps/Flutter/userImage/u$apiKeyU';
        String targetFilePath = path.join(createFolderPath, path.basename(_oldimageFile!.path));
        _oldimageFile!.copySync(targetFilePath);

        // 轉 bytes
        Uint8List bytes = await _oldimageFile!.readAsBytes();
        List<int> img = bytes.toList();

        final request = UpdateImagesRequest(
          sessionID: apiKeyS,
          img1: img,
          img2: null,
          img3: null,
          img4: null,
          img5: null,
        );
        await GrpcInfoService.client.updateImages(request);
        onTapNextPage(context);
      } on GrpcError catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable update image in Image at $e");
        throw Exception("Error occurred while fetching profile edit.");
      }
  }

  // Grpc
  void updateDataGrpcRequest(BuildContext context) async {
    if (updateNickNameController.text.isEmpty) {
      showErrorDialog(context, "ニックネームはまだ入力されていません");
    } else if (updateCityController.text.isEmpty) {
      showErrorDialog(context, "居住地はまだ入力されていません");
    } else if (updateSexualController.text.isEmpty) {
      showErrorDialog(context, "性的指向はまだ入力されていません");
    } else if (updateHeightController.text.isEmpty) {
      showErrorDialog(context, "身長はまだ入力されていません");
    } else if (!isPureNumber(updateHeightController.text)) {
      showErrorDialog(context, "入力した身長は数字じゃありません");
    } else if (updateWeightController.text.isEmpty) {
      showErrorDialog(context, "体重はまだ入力されていません");
    } else if (!isPureNumber(updateWeightController.text)) {
      showErrorDialog(context, "入力した体重は数字じゃありません");
    } else if (updateSpeakLanguageController.text.isEmpty) {
      showErrorDialog(context, "学歴はまだ入力されていません");
    } else if (updateJobController.text.isEmpty) {
      showErrorDialog(context, "仕事はまだ入力されていません");
    } else if (!isPureNumber(updateAnnualSalaryController.text)) {
      showErrorDialog(context, "入力した年収は数字じゃありません");
    } else if (updateSociabilityController.text.isEmpty) {
      showErrorDialog(context, "社交力はまだ入力されていません");
    } else if (updateReligiousController.text.isEmpty) {
      showErrorDialog(context, "宗教はまだ入力されていません");
    } else if (updateIntroduceController.text.isEmpty) {
      showErrorDialog(context, "自己紹介はまだ入力されていません");
    } else {
      setState(() {
        showLoadDialog(context);
      });
      await Future.delayed(Duration(seconds: 1));
      try {
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final request = UpdateCanChangeRequest(
          sessionID: apiKeyS,
          nickName: updateNickNameController.text,
          city: updateCityController.text,
          sexual: updateSexualController.text,
          height: int.parse(updateHeightController.text),
          weight: int.parse(updateWeightController.text),
          speaklanguage: updateSpeakLanguageController.text,
          education: updateEducationController.text,
          job: updateJobController.text,
          annualSalary: int.parse(updateAnnualSalaryController.text),
          sociability: updateSociabilityController.text,
          religious: updateReligiousController.text,
          introduce: updateIntroduceController.text,
        );
        await GrpcInfoService.client.updateCanChange(request);
        updateImage(context);
        onTapNextPage(context);
        await Future.delayed(Duration(milliseconds: 500));
        showLogoDialog(context, "個人情報もアップしました", true);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data");
        throw Exception("Error occurred while fetching profile edit.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: Text("プロフィール編集", style: theme.textTheme.headlineMedium)),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
          child: Column(
            children: [
              // photos
              _buildImages(context, mediaH),

              // Introduce
              CustomInputBar(titleName: "自己紹介:", backendPart: _buildUpdateIntroduceInput(context, mediaH, mediaW)),
              SizedBox(height: mediaH / 50),

              // Nickname
              CustomInputBar(titleName: "ニックネーム:", backendPart: _buildUpdateNickNameInput(context)),
              SizedBox(height: mediaH / 50),

              // Height
              CustomInputBar(titleName: "身長:", backendPart: _buildUpdateHeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Weight
              CustomInputBar(titleName: "体重:", backendPart: _buildUpdateWeightInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildUpdateCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Education
              CustomInputBar(titleName: "学歴:", backendPart: _buildUpdateEducationInput(context)),
              SizedBox(height: mediaH / 50),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildUpdateSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // Job
              CustomInputBar(titleName: "職種:", backendPart: _buildUpdateJobInput(context)),
              SizedBox(height: mediaH / 50),

              // Annual Salary
              CustomInputBar(titleName: "年収:", backendPart: _buildUpdateAnnualSalaryInput(context)),
              SizedBox(height: mediaH / 50),

              // Sexual
              CustomInputBar(titleName: "性的指向:", backendPart: _buildUpdateSexualInput(context)),
              SizedBox(height: mediaH / 50),

              // Sociability
              CustomInputBar(titleName: "社交力:", backendPart: _buildUpdateSociabilityInput(context)),
              SizedBox(height: mediaH / 50),

              // Relighious
              CustomInputBar(titleName: "宗教:", backendPart: _buildUpdateReligiousInput(context)),
              SizedBox(height: mediaH / 25),

              // button
              _buildSubmitButton(context),
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
            icon: Container(
              width: mediaH / 6.5,
              height: mediaH / 6.5,
              child: ClipOval(child: Image.file(_oldimageFile!, fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }

  /// Nickname
  Widget _buildUpdateNickNameInput(BuildContext context) {
    return CustomInputFormBar(controller: updateNickNameController, hintText: "仆街");
  }

  /// City
  Widget _buildUpdateCityInput(BuildContext context) {
    return CustomInputFormBar(controller: updateCityController, hintText: "大阪");
  }

  /// Sexual
  Widget _buildUpdateSexualInput(BuildContext context) {
    return CustomInputFormBar(controller: updateSexualController, hintText: "異性愛");
  }

  /// Height
  Widget _buildUpdateHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: updateHeightController, hintText: "170cm");
  }

  /// Weight
  Widget _buildUpdateWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: updateWeightController, hintText: "60kg");
  }

  /// Education
  Widget _buildUpdateEducationInput(BuildContext context) {
    return CustomInputFormBar(controller: updateEducationController, hintText: "高校生");
  }

  /// Speak Language
  Widget _buildUpdateSpeakLanguageInput(BuildContext context) {
    return CustomInputFormBar(controller: updateSpeakLanguageController, hintText: "言語");
  }

  /// Job
  Widget _buildUpdateJobInput(BuildContext context) {
    return CustomInputFormBar(controller: updateJobController, hintText: "ホスト");
  }

  /// Annual Salary
  Widget _buildUpdateAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(controller: updateAnnualSalaryController, hintText: "4000");
  }

  /// Sociability
  Widget _buildUpdateSociabilityInput(BuildContext context) {
    return CustomInputFormBar(controller: updateSociabilityController, hintText: "人たら神");
  }

  /// Religious
  Widget _buildUpdateReligiousInput(BuildContext context) {
    return CustomInputFormBar(controller: updateReligiousController, hintText: "多神教");
  }

  /// Introduce
  Widget _buildUpdateIntroduceInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: mediaW / 75)),
      height: mediaH / 5,
      controller: updateIntroduceController,
      hintText: "亜dさdさだだ",
      maxLines: 8,
      focusNode: FocusNode(),
      onTap: () {
        FocusNode().requestFocus();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: mediaH / 200, vertical: mediaW / 50),
    );
  }

  /// button
  Widget _buildSubmitButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "送信",
      onPressed: () {
        updateDataGrpcRequest(context);
      },
    );
  }

  onTapNextPage(BuildContext context) {
    Navigator.pop(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ContainerScreen(number: 3),
        fullscreenDialog: true,
        transitionDuration: Duration(milliseconds: 500),
        reverseTransitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
