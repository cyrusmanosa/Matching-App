import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_hobby.pb.dart';
import 'package:dating_your_date/pb/rpc_search.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/presentation/DeleteTarget.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_checkBox_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class HobbyCondition extends StatefulWidget {
  HobbyCondition({Key? key, this.arguments}) : super(key: key);

  final String? arguments;
  @override
  _HobbyConditionState createState() => _HobbyConditionState();
}

class _HobbyConditionState extends State<HobbyCondition> {
  bool? haveTable;
  bool confirmBtn = false;
  String country = "";
  Iterable<String> oldHobbyAddress = [];
  Iterable<String> oldHobbylanguage = [];
  Iterable<String> newHoobyAddress = [];
  Iterable<String> newHobbylanguage = [];
  TextEditingController hobbyEraController = TextEditingController();
  TextEditingController hobbyGenderController = TextEditingController();
  TextEditingController hobbySpeakLanguageController = TextEditingController();
  TextEditingController hobbyFindTypeController = TextEditingController();
  TextEditingController hobbyExperienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getHobby();
    getCountry();
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  Future<void> checkTargetUserTable(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    // Search
    try {
      final req = SearchRequestH(sessionID: apiKeyS);
      final rsp = await GrpcInfoService.client.searchTargetHobby(req);
      if (rsp.resu.len != 0) {
        checkTargetList(context, rsp);
      } else {
        await showLogoDialog(context, "新しい条件で合わせるパーセントは0%です。", false);
        await Future.delayed(Duration(seconds: 2));
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } on GrpcError {
      await showErrorDialog(context, "検索エンジニアリングにエラーがあります。");
      throw Exception("検索エンジニアリングにエラーがあります。");
    }
  }

  void getCountry() async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // take country
    final crequest = GetFixRequest(sessionID: apiKeyS, userID: userid);
    final result = await GrpcInfoService.client.getFix(crequest);
    setState(() {
      country = result.fix.country;
    });
  }

  void getHobby() async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      // Hobby
      final request = GetHobbyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getHobby(request);
      setState(() {
        haveTable = true;
        hobbyEraController = TextEditingController(text: response.h.era.toString());
        hobbyGenderController = TextEditingController(text: response.h.gender.toString());
        hobbyFindTypeController = TextEditingController(text: response.h.findType.toString());
        hobbyExperienceController = TextEditingController(text: response.h.experience.toString());
        oldHobbyAddress = response.h.city;
        oldHobbylanguage = response.h.speaklanguage;
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  void checkTargetList(BuildContext context, SearchResponseH rsp) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    String? apiKeyU = await globalUserId.read(key: 'UserID');
    final userid = int.tryParse(apiKeyU!);
    // take target list
    final myRequest = GetTargetListRequest(sessionID: apiKeyS, userID: userid);
    final myResponse = await GrpcInfoService.client.getTargetList(myRequest);
    for (int i = 0; i < rsp.resu.resultID.length; i++) {
      // myself
      if (rsp.resu.resultID[i] != myResponse.tl.target1ID &&
          rsp.resu.resultID[i] != myResponse.tl.target2ID &&
          rsp.resu.resultID[i] != myResponse.tl.target3ID) {
        try {
          // check new target list
          final newRequest = GetTargetListRequest(sessionID: apiKeyS, userID: rsp.resu.resultID[i]);
          final newResponse = await GrpcInfoService.client.getTargetList(newRequest);
          if (newResponse.tl.target1ID != userid && newResponse.tl.target2ID != userid && newResponse.tl.target3ID != userid) {
            if (myResponse.tl.target1ID != 0 && myResponse.tl.target2ID != 0 && myResponse.tl.target3ID != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "趣味"),
                  fullscreenDialog: true,
                ),
              );
              break;
            } else {
              await Future.delayed(Duration(seconds: 1));
              await showLogoDialog(context, "新しいターゲットも準備しました", false);
              await Future.delayed(Duration(seconds: 1));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "趣味"),
                  fullscreenDialog: true,
                ),
              );
              break;
            }
          } else {
            if (rsp.resu.len > 1) {
              checkTargetUserTable(context);
            }
            await showLogoDialog(context, "新しい条件で合わせるパーセントは0%です。", false);
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
            Navigator.pop(context);
          }
        } on GrpcError {
          if (myResponse.tl.target1ID != 0 && myResponse.tl.target2ID != 0 && myResponse.tl.target3ID != 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "趣味"),
                fullscreenDialog: true,
              ),
            );
            break;
          } else {
            await Future.delayed(Duration(seconds: 1));
            await showLogoDialog(context, "新しいターゲットも準備しました", false);
            await Future.delayed(Duration(seconds: 1));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "趣味"),
                fullscreenDialog: true,
              ),
            );
            break;
          }
        }
      } else {
        if (rsp.resu.len > 1 && rsp.resu.len < 3) {
          int sID = 0;
          for (int i = 0; i < rsp.resu.len; i++) {
            if (rsp.resu.resultID[i] == myResponse.tl.target1ID ||
                rsp.resu.resultID[i] == myResponse.tl.target2ID ||
                rsp.resu.resultID[i] == myResponse.tl.target3ID) {
              sID++;
            }
          }

          if (sID == 2) {
            await showLogoDialog(context, "新しい条件で合わせるパーセントは0%です。", false);
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
            Navigator.pop(context);
            break;
          }
        }
      }
    }
  }

  void updatehobby(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (haveTable == true) {
      // Update
      try {
        setState(() {
          showLoadDialog(context);
        });
        final request = UpdateHobbyRequest(
          sessionID: apiKeyS,
          era: int.tryParse(hobbyEraController.text),
          city: newHoobyAddress.isEmpty ? oldHobbyAddress : newHoobyAddress,
          gender: hobbyGenderController.text,
          speaklanguage: newHobbylanguage.isEmpty ? oldHobbylanguage : newHobbylanguage,
          findType: hobbyFindTypeController.text,
          experience: int.tryParse(hobbyExperienceController.text),
        );
        await GrpcInfoService.client.updateHobby(request);
        await Future.delayed(Duration(seconds: 1));
        await showLogoDialog(context, "ホビーの条件を更新しました", false);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        await checkTargetUserTable(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("ホビーの更新中にエラーが発生しました。");
      }
    } else {
      if (!isPureNumber(hobbyEraController.text)) {
        await showErrorDialog(context, "入力した年代は数字ではありません");
      } else if (hobbyEraController.text.isEmpty) {
        await showErrorDialog(context, "年代はまだ設定していません");
      } else if (hobbyGenderController.text.isEmpty) {
        await showErrorDialog(context, "相手の性別はまだ設定していません");
      } else if (hobbyFindTypeController.text.isEmpty) {
        await showErrorDialog(context, "趣味 - タイプはまだ設定していません");
      } else if (!isPureNumber(hobbyExperienceController.text)) {
        await showErrorDialog(context, "入力した経験は数字ではありません");
      } else if (hobbyExperienceController.text.isEmpty) {
        await showErrorDialog(context, "経験はまだ設定していません");
      } else if (newHobbylanguage.isEmpty) {
        await showErrorDialog(context, "言語はまだ設定していません");
      } else if (newHoobyAddress.isEmpty) {
        await showErrorDialog(context, "居住地はまだ設定していません");
      } else {
        // Create
        try {
          setState(() {
            showLoadDialog(context);
          });
          final request = CreateHobbyRequest(
            sessionID: apiKeyS,
            era: int.tryParse(hobbyEraController.text),
            city: newHoobyAddress,
            gender: hobbyGenderController.text,
            speaklanguage: newHobbylanguage,
            findType: hobbyFindTypeController.text,
            experience: int.tryParse(hobbyExperienceController.text),
          );
          await GrpcInfoService.client.createHobby(request);
          await Future.delayed(Duration(seconds: 1));
          await showLogoDialog(context, "ホビーの条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("ホビーの条件を入力中にエラーが発生しました。");
        }
      }
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
        appBar: buildAppBar(context, "趣味の条件", true),
        resizeToAvoidBottomInset: true,
        backgroundColor: appTheme.bgColor,
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 25),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "*年代:", backendPart: _buildHobbyResetEraInput()),
                SizedBox(height: mediaH / 50),

                // Gender
                CustomInputBar(titleName: "相手の性別:", backendPart: _buildHobbyResetGenderInput()),
                SizedBox(height: mediaH / 50),

                // Hobby Type
                CustomInputBar(titleName: "*趣味 - タイプ:", backendPart: _buildHobbyhobbyTypeInput()),
                SizedBox(height: mediaH / 50),

                // Experience
                CustomInputBar(titleName: "経験 - 年以上:", backendPart: _buildHobbyResetExperienceInput()),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語:", backendPart: _buildHobbySpeakLanguageInput()),
                SizedBox(height: mediaH / 100),

                // City
                if (country.isNotEmpty) CustomInputBar(titleName: "*居住地:", backendPart: _buildHobbyResetCityInput()),
                SizedBox(height: mediaH / 40),

                // button
                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Era
  Widget _buildHobbyResetEraInput() {
    return CustomInputFormBar(controller: hobbyEraController, hintText: "30");
  }

  /// Gender
  Widget _buildHobbyResetGenderInput() {
    return CustomDropDownBar(controller: hobbyGenderController, hintText: hobbyGenderController.text, itemArray: genderList);
  }

  /// Hobby Type
  Widget _buildHobbyhobbyTypeInput() {
    return CustomDropDownBar(controller: hobbyFindTypeController, hintText: hobbyFindTypeController.text, itemArray: hobbyTpye);
  }

  /// Experience
  Widget _buildHobbyResetExperienceInput() {
    return CustomInputFormBar(controller: hobbyExperienceController, hintText: "3");
  }

  /// Speak Language
  Widget _buildHobbySpeakLanguageInput() {
    return CustomMultiSelectDropDownBar(
      itemArray: languages,
      onChanged: (value) {
        newHobbylanguage = value;
      },
    );
  }

  /// City
  Widget _buildHobbyResetCityInput() {
    return CustomMultiSelectDropDownBar(
      itemArray: asiaCities[country],
      onChanged: (value) {
        newHoobyAddress = value;
      },
    );
  }

  /// Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        updatehobby(context);
      },
    );
  }
}
