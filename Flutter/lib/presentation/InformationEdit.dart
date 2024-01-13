import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as customImage;

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, this.canData, this.imgIcon}) : super(key: key);
  final CanChange? canData;
  final List<File>? imgIcon;

  @override
  _InformationEditState createState() => _InformationEditState();
}

class _InformationEditState extends State<InformationEdit> {
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
  List<File>? _newimageFile;

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
    _newimageFile = widget.imgIcon!;
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  // update icon
  void _uploadPhotoToNewFile(int item) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final directory = await getApplicationDocumentsDirectory();
      try {
        final newFilePath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
        await file.copy(newFilePath);

        setState(() {
          _newimageFile![item] = File(newFilePath);
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  // add update icon
  void _addUploadPhotoToNewFile(int item) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final directory = await getApplicationDocumentsDirectory();
      try {
        final newFilePath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
        await file.copy(newFilePath);

        setState(() {
          _newimageFile!.add(File(newFilePath));
        });
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  void updateImage(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    try {
      List<List<int>> imageBytesList = [];
      for (var imageFile in _newimageFile!) {
        Uint8List bytes = await imageFile.readAsBytes();
        final image = customImage.decodeImage(bytes);
        final double ratio = image!.width / image.height;
        final int targetWidth = 1024;
        final int targetHeight = (targetWidth / ratio).round();
        final resizedImage = customImage.copyResize(image, width: targetWidth, height: targetHeight);
        final compressedImage = customImage.encodeJpg(resizedImage, quality: 85);
        imageBytesList.add(compressedImage.toList());
      }

      final request = UpdateImagesRequest(
        sessionID: apiKeyS,
        img1: imageBytesList.length > 0 ? imageBytesList[0] : [],
        img2: imageBytesList.length > 1 ? imageBytesList[1] : [],
        img3: imageBytesList.length > 2 ? imageBytesList[2] : [],
        img4: imageBytesList.length > 3 ? imageBytesList[3] : [],
        img5: imageBytesList.length > 4 ? imageBytesList[4] : [],
      );
      await GrpcInfoService.client.updateImages(request);
    } on GrpcError catch (e) {
      Navigator.pop(context);
      showErrorDialog(context, "Error: validatable update image in Image at $e", false);
      throw Exception("Error occurred while fetching profile edit.");
    }
  }

  // Grpc
  void updateDataGrpcRequest(BuildContext context) async {
    if (updateNickNameController.text.isEmpty) {
      showErrorDialog(context, "ニックネームはまだ入力されていません", false);
    } else if (updateCityController.text.isEmpty) {
      showErrorDialog(context, "居住地はまだ入力されていません", false);
    } else if (updateSexualController.text.isEmpty) {
      showErrorDialog(context, "性的指向はまだ入力されていません", false);
    } else if (updateHeightController.text.isEmpty) {
      showErrorDialog(context, "身長はまだ入力されていません", false);
    } else if (!isPureNumber(updateHeightController.text)) {
      showErrorDialog(context, "入力した身長は数字じゃありません", false);
    } else if (updateWeightController.text.isEmpty) {
      showErrorDialog(context, "体重はまだ入力されていません", false);
    } else if (!isPureNumber(updateWeightController.text)) {
      showErrorDialog(context, "入力した体重は数字じゃありません", false);
    } else if (updateSpeakLanguageController.text.isEmpty) {
      showErrorDialog(context, "学歴はまだ入力されていません", false);
    } else if (updateJobController.text.isEmpty) {
      showErrorDialog(context, "仕事はまだ入力されていません", false);
    } else if (!isPureNumber(updateAnnualSalaryController.text)) {
      showErrorDialog(context, "入力した年収は数字じゃありません", false);
    } else if (updateSociabilityController.text.isEmpty) {
      showErrorDialog(context, "社交力はまだ入力されていません", false);
    } else if (updateReligiousController.text.isEmpty) {
      showErrorDialog(context, "宗教はまだ入力されていません", false);
    } else if (updateIntroduceController.text.isEmpty) {
      showErrorDialog(context, "自己紹介はまだ入力されていません", false);
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
        Navigator.pop(context);
        showLogoDialog(context, "個人情報もアップしました", false);
      } on GrpcError {
        Navigator.pop(context);
        showErrorDialog(context, "Error: validatable input data", false);
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
      appBar: _buildheader(context, mediaH, mediaW),
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // photos
              _buildImages(context, mediaH, mediaW),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mediaW / 13),
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }

  // Header
  PreferredSizeWidget _buildheader(BuildContext context, double mediaH, double mediaW) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: mediaW / 7),
            child: Text("プロフィール編集", style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
          ),
        ],
      ),
      actions: [
        if (_newimageFile!.length < 5)
          IconButton(
            icon: Icon(Icons.add_photo_alternate_outlined),
            onPressed: () {
              _addUploadPhotoToNewFile(_newimageFile!.length);
            },
          ),
      ],
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Widget _buildImages(BuildContext context, double mediaH, double mediaW) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: mediaH / 100, horizontal: mediaW / 100),
      height: mediaH / 6.5,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _newimageFile!.length,
              itemBuilder: (context, index) {
                return _buildImageContainer(context, mediaH, mediaW, _newimageFile![index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, double mediaH, double mediaW, File imageFile, int item) {
    return InkWell(
      onTap: () {
        print(item.toString());
        _uploadPhotoToNewFile(item);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
        width: mediaH / 6.5,
        height: mediaH / 6.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent, width: 3.5),
        ),
        child: ClipOval(
          child: Container(
            width: mediaH / 6.5,
            height: mediaH / 6.5,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.file(imageFile, fit: BoxFit.cover),
          ),
        ),
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
      text: "確認",
      onPressed: () {
        updateDataGrpcRequest(context);
        Navigator.pop(context);
      },
    );
  }
}
