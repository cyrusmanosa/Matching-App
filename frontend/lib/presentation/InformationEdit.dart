import 'dart:io';

import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_images.pb.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Show_Image.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_checkBox_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as customImage;

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, this.canData, this.imgIcon, this.country}) : super(key: key);
  final String? country;
  final CanChange? canData;
  final List<Uint8List>? imgIcon;

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
  TextEditingController updateHobbyTypeController = TextEditingController();
  TextEditingController updateAccompanyController = TextEditingController();
  TextEditingController updateExperienceController = TextEditingController();

  String? oldPath;
  List<Uint8List>? _newimageFile;
  List<String> myLanguages = [];
  @override
  void initState() {
    super.initState();
    updateNickNameController = TextEditingController(text: widget.canData?.nickName);
    updateHeightController = TextEditingController(text: widget.canData?.height.toString());
    updateWeightController = TextEditingController(text: widget.canData?.weight.toString());
    updateAnnualSalaryController = TextEditingController(text: widget.canData?.annualSalary.toString());
    updateIntroduceController = TextEditingController(text: widget.canData?.introduce);
    updateExperienceController = TextEditingController(text: widget.canData?.experience.toString());
    _newimageFile = widget.imgIcon;
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
      final bytes = await file.readAsBytes();
      final uint8List = bytes.buffer.asUint8List();

      setState(() {
        _newimageFile![item] = uint8List;
      });
    }
  }

  // add update icon
  void _addUploadPhotoToNewFile(int item) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final uint8List = bytes.buffer.asUint8List();

      setState(() {
        _newimageFile![item] = uint8List;
      });
    }
  }

  Future<void> updateImage(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    try {
      List<List<int>> imageBytesList = [];
      for (var imageFile in _newimageFile!) {
        final image = customImage.decodeImage(imageFile);
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
      await showErrorDialog(context, "Error: validatable update image in Image at $e");
      throw Exception("Error occurred while fetching profile edit.");
    }
  }

  // Grpc
  void updateDataGrpcRequest(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = UpdateCanChangeRequest(
        sessionID: apiKeyS,
        nickName: updateNickNameController.text,
        city: updateCityController.text == "" ? widget.canData!.city : updateCityController.text,
        sexual: updateSexualController.text == "" ? widget.canData!.sexual : updateSexualController.text,
        height: int.parse(updateHeightController.text),
        weight: int.parse(updateWeightController.text),
        speaklanguage: myLanguages.isEmpty ? widget.canData!.speaklanguage : myLanguages,
        education: updateEducationController.text == "" ? widget.canData!.education : updateEducationController.text,
        job: updateJobController.text == "" ? widget.canData!.job : updateJobController.text,
        annualSalary: int.parse(updateAnnualSalaryController.text),
        hobbyType: updateHobbyTypeController.text == "" ? widget.canData!.hobbyType : updateHobbyTypeController.text,
        experience: int.tryParse(updateExperienceController.text),
        accompanyType: updateAccompanyController.text == "" ? widget.canData!.accompanyType : updateAccompanyController.text,
        sociability: updateSociabilityController.text == "" ? widget.canData!.sociability : updateSociabilityController.text,
        religious: updateReligiousController.text == "" ? widget.canData!.religious : updateReligiousController.text,
        introduce: updateIntroduceController.text,
      );
      setState(() {
        showLoadDialog(context);
      });
      Future.delayed(Duration(seconds: 1));
      await GrpcInfoService.client.updateCanChange(request);
      updateImage(context);
      await showLogoDialog(context, "個人情報もアップしました", false);
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerScreen(number: 3)));
      });
    } on GrpcError {
      Navigator.pop(context);
      await showErrorDialog(context, "エラー：検証可能な入力データがありません。");
      throw Exception("プロフィールの編集中にエラーが発生しました。");
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
      child: Scaffold(
        appBar: _buildheader(context, mediaH, mediaW),
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // photos
              _buildImages(context, mediaH, mediaW),

              // Introduce
              CustomInputBar(titleName: "自己紹介:", backendPart: _buildUpdateIntroduceInput(context, mediaH, mediaW)),
              SizedBox(height: mediaH / 50),

              // Nickname
              CustomInputBar(titleName: "ニックネーム:", backendPart: _buildUpdateNickNameInput(context)),
              SizedBox(height: mediaH / 50),

              // Height
              CustomInputBar(titleName: " 身長 - cm:", backendPart: _buildUpdateHeightInput(context)),
              SizedBox(height: mediaH / 50),

              // Weight
              CustomInputBar(titleName: " 体重 - kg:", backendPart: _buildUpdateWeightInput(context)),
              SizedBox(height: mediaH / 50),

              // City
              CustomInputBar(titleName: "居住地:", backendPart: _buildUpdateCityInput(context)),
              SizedBox(height: mediaH / 50),

              // Education
              CustomInputBar(titleName: "学歴:", backendPart: _buildUpdateEducationInput(context)),
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

              // hobby
              CustomInputBar(titleName: "趣味 - タイプ:", backendPart: _buildHobbyhobbyTypeInput(context)),
              SizedBox(height: mediaH / 55),

              // Experience
              CustomInputBar(titleName: "経験 - 年:", backendPart: _buildHobbyResetExperienceInput(context)),
              SizedBox(height: mediaH / 50),

              // Sociability
              CustomInputBar(titleName: "相伴のタイプ:", backendPart: _buildAccompanyTypeInput(context)),
              SizedBox(height: mediaH / 55),

              // Relighious
              CustomInputBar(titleName: "宗教:", backendPart: _buildUpdateReligiousInput(context)),
              SizedBox(height: mediaH / 75),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildUpdateSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 50),

              // button
              _buildSubmitButton(context),
              SizedBox(height: mediaH / 15),
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
          // return
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          // title
          Padding(
            padding: EdgeInsets.only(left: mediaW / 7),
            child: Text("プロフィール編集", style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
          ),
        ],
      ),

      // input
      actions: [
        if (_newimageFile!.length < 5)
          Container(
            margin: EdgeInsets.symmetric(horizontal: mediaW / 50),
            decoration: BoxDecoration(color: appTheme.grey300, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                _addUploadPhotoToNewFile(_newimageFile!.length);
              },
              icon: Icon(Icons.add, size: mediaH / 30, color: appTheme.grey800),
            ),
          ),
      ],
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Widget _buildImages(BuildContext context, double mediaH, double mediaW) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: mediaH / 50),
      height: mediaH / 6.5,
      child: Row(
        children: [
          // far left
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

  Widget _buildImageContainer(BuildContext context, double mediaH, double mediaW, Uint8List imageFile, int item) {
    return InkWell(
      onTap: () {
        _uploadPhotoToNewFile(item);
      },
      child: customImageDesign(context, imageFile, mediaH, mediaW),
    );
  }

  // Hobby Type
  Widget _buildHobbyhobbyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: updateHobbyTypeController, hintText: widget.canData!.hobbyType, itemArray: hobbyTpye);
  }

  /// Accompany Type
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: updateAccompanyController, hintText: widget.canData!.accompanyType, itemArray: accompanyType);
  }

  /// Reset Experience
  Widget _buildHobbyResetExperienceInput(BuildContext context) {
    return CustomInputFormBar(controller: updateExperienceController);
  }

  /// Nickname
  Widget _buildUpdateNickNameInput(BuildContext context) {
    return CustomInputFormBar(controller: updateNickNameController);
  }

  /// City
  Widget _buildUpdateCityInput(BuildContext context) {
    return CustomDropDownBar(controller: updateCityController, hintText: widget.canData!.city, itemArray: asiaCities[widget.country!]);
  }

  /// Sexual
  Widget _buildUpdateSexualInput(BuildContext context) {
    return CustomDropDownBar(controller: updateSexualController, hintText: widget.canData!.sexual, itemArray: sexualList);
  }

  /// Height
  Widget _buildUpdateHeightInput(BuildContext context) {
    return CustomInputFormBar(controller: updateHeightController);
  }

  /// Weight
  Widget _buildUpdateWeightInput(BuildContext context) {
    return CustomInputFormBar(controller: updateWeightController);
  }

  /// Education
  Widget _buildUpdateEducationInput(BuildContext context) {
    return CustomDropDownBar(controller: updateEducationController, hintText: widget.canData!.education, itemArray: educationLevels);
  }

  /// Speak Language
  Widget _buildUpdateSpeakLanguageInput(BuildContext context) {
    String hintL = "";
    for (int i = 0; i < widget.canData!.speaklanguage.length; i++) {
      if (i > 0) {
        hintL += " , ";
      }
      hintL += widget.canData!.speaklanguage[i];
    }
    return CustomMultiSelectDropDownBar(
      itemArray: languages,
      onChanged: (value) {
        myLanguages = value;
      },
      hintText: hintL,
    );
  }

  /// Job
  Widget _buildUpdateJobInput(BuildContext context) {
    return CustomDropDownBar(controller: updateJobController, hintText: widget.canData!.job, itemArray: occupations);
  }

  /// Annual Salary
  Widget _buildUpdateAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(controller: updateAnnualSalaryController);
  }

  /// Sociability
  Widget _buildUpdateSociabilityInput(BuildContext context) {
    return CustomDropDownBar(
        controller: updateSociabilityController, hintText: widget.canData!.sociability, itemArray: socialPersonalities);
  }

  /// Religious
  Widget _buildUpdateReligiousInput(BuildContext context) {
    return CustomDropDownBar(controller: updateReligiousController, hintText: widget.canData!.religious, itemArray: religions);
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
      },
    );
  }
}
