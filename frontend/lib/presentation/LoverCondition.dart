import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_lover.pb.dart';
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

class LoverCondition extends StatefulWidget {
  LoverCondition({Key? key}) : super(key: key);

  @override
  _LoverConditionState createState() => _LoverConditionState();
}

class _LoverConditionState extends State<LoverCondition> {
  bool? haveTable;
  String country = "";
  bool confirmBtn = false;
  List<String> oldLoverAddress = [];
  List<String> oldLoverLanguage = [];
  List<String> newLoverAddress = [];
  List<String> newLoverLanguage = [];

  TextEditingController loverMinAgeController = TextEditingController();
  TextEditingController loverMaxAgeController = TextEditingController();
  TextEditingController loverGenderController = TextEditingController();
  TextEditingController loverSexualController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLover(context);
    getCountry(context);
  }

  bool isPureNumber(String value) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(value);
  }

  void getCountry(BuildContext context) async {
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

  void getLover(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      // check tabel
      final request = GetLoverRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getLover(request);
      setState(() {
        haveTable = true;
        loverMinAgeController = TextEditingController(text: response.l.minAge.toString());
        loverMaxAgeController = TextEditingController(text: response.l.maxAge.toString());
        loverGenderController = TextEditingController(text: response.l.gender.toString());
        loverSexualController = TextEditingController(text: response.l.sexual.toString());
        oldLoverAddress = response.l.city;
        oldLoverLanguage = response.l.speaklanguage;
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  Future<void> checkTargetUserTable(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    // Search
    try {
      final req = SearchRequestL(sessionID: apiKeyS);
      final rsp = await GrpcInfoService.client.searchTargetLover(req);
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

  void checkTargetList(BuildContext context, SearchResponseL rsp) async {
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
          final newRequest = GetTargetListRequest(sessionID: apiKeyS, userID: rsp.resu.resultID[i]);
          final newResponse = await GrpcInfoService.client.getTargetList(newRequest);
          // check new target list not my userID
          if (newResponse.tl.target1ID != userid && newResponse.tl.target2ID != userid && newResponse.tl.target3ID != userid) {
            // check target list have a empty
            if (myResponse.tl.target1ID != 0 && myResponse.tl.target2ID != 0 && myResponse.tl.target3ID != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "恋人"),
                  fullscreenDialog: true,
                ),
              );
              break;
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "恋人"),
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
                builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "恋人"),
                fullscreenDialog: true,
              ),
            );
            break;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "恋人"),
                  fullscreenDialog: true),
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
          }
        }
      }
    }
  }

  void updateLover(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (haveTable == true) {
      setState(() {
        showLoadDialog(context);
      });
      // Update
      try {
        final request = UpdateLoverRequest(
          sessionID: apiKeyS,
          minAge: int.parse(loverMinAgeController.text),
          maxAge: int.parse(loverMaxAgeController.text),
          city: newLoverAddress.isEmpty ? oldLoverAddress : newLoverAddress,
          gender: loverGenderController.text,
          sexual: loverSexualController.text,
          speaklanguage: newLoverLanguage.isEmpty ? oldLoverLanguage : newLoverLanguage,
        );
        await GrpcInfoService.client.updateLover(request);
        await Future.delayed(Duration(seconds: 1));
        await showLogoDialog(context, "恋人の条件を更新しました", false);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        checkTargetUserTable(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("恋人条件の更新中にエラーが発生しました。");
      }
    } else {
      if (!isPureNumber(loverMinAgeController.text) || !isPureNumber(loverMaxAgeController.text)) {
        await showErrorDialog(context, "入力した年齢は数字ではありません");
      } else if (loverMinAgeController.text.isEmpty || loverMaxAgeController.text.isEmpty) {
        await showErrorDialog(context, "年齢はまだ設定していません");
      } else if (loverMinAgeController.text.isEmpty || loverMaxAgeController.text.isEmpty) {
        await showErrorDialog(context, "最低年齢と最高年齢はまだ設定していません");
      } else if (int.parse(loverMinAgeController.text) < 18) {
        await showErrorDialog(context, "最低年齢は18歳です");
      } else if (loverGenderController.text.isEmpty) {
        await showErrorDialog(context, "相手の性別はまだ設定していません");
      } else if (loverSexualController.text.isEmpty) {
        await showErrorDialog(context, "相手の性的指向はまだ設定していません");
      } else if (newLoverLanguage.isEmpty) {
        await showErrorDialog(context, "言語はまだ設定していません");
      } else if (newLoverAddress.isEmpty) {
        await showErrorDialog(context, "居住地はまだ設定していません");
      } else {
        // Create
        try {
          setState(() {
            showLoadDialog(context);
          });
          final request = CreateLoverRequest(
            sessionID: apiKeyS,
            minAge: int.parse(loverMinAgeController.text),
            maxAge: int.parse(loverMaxAgeController.text),
            city: newLoverAddress,
            gender: loverGenderController.text,
            sexual: loverSexualController.text,
            speaklanguage: newLoverLanguage,
          );

          await GrpcInfoService.client.createLover(request);
          await Future.delayed(Duration(seconds: 1));
          await showLogoDialog(context, "恋人の条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("恋人条件を入力中にエラーが発生しました。");
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
        appBar: buildAppBar(context, "恋人の条件", true),
        resizeToAvoidBottomInset: true,
        backgroundColor: appTheme.bgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 25),
          child: Column(
            children: [
              Row(
                children: [
                  CustomInputBar(titleName: "*年齢:", backendPart: _buildLoverMinAgeInput(context, mediaH, mediaW)),
                  SizedBox(width: mediaW / 30),
                  Text("から"),
                  SizedBox(width: mediaW / 30),
                  CustomInputBar(titleName: "", backendPart: _buildLoverMaxAgeInput(context, mediaH, mediaW)),
                ],
              ),
              SizedBox(height: mediaH / 100),

              // Gender
              CustomInputBar(titleName: "*相手の性別:", backendPart: _buildLoverResetGenderInput(context)),
              SizedBox(height: mediaH / 50),

              // Sexual
              CustomInputBar(titleName: "*相手の性的指向:", backendPart: _buildLoverResetSexualInput(context)),
              SizedBox(height: mediaH / 50),

              // Speak Language
              CustomInputBar(titleName: "言語:", backendPart: _buildLoverSpeakLanguageInput(context)),
              SizedBox(height: mediaH / 100),

              // City
              if (country.isNotEmpty) CustomInputBar(titleName: "*居住地:", backendPart: _buildLoverResetCityInput(context)),
              SizedBox(height: mediaH / 40),

              // button
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Min Age
  Widget _buildLoverMinAgeInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaH / 16,
      width: mediaW / 7.5,
      maxLength: 3,
      controller: loverMinAgeController,
      hintText: "25",
    );
  }

  /// Min Age
  Widget _buildLoverMaxAgeInput(BuildContext context, double mediaH, double mediaW) {
    return CustomInputFormBar(
      alignment: Alignment.centerLeft,
      height: mediaH / 16,
      width: mediaW / 7.5,
      maxLength: 3,
      controller: loverMaxAgeController,
      hintText: "30",
    );
  }

  /// Reset City
  Widget _buildLoverResetCityInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: asiaCities[country],
      onChanged: (value) {
        newLoverAddress = value;
      },
    );
  }

  /// Gender
  Widget _buildLoverResetGenderInput(BuildContext context) {
    return CustomDropDownBar(controller: loverGenderController, hintText: genderList[0], itemArray: genderList);
  }

  /// Sexual
  Widget _buildLoverResetSexualInput(BuildContext context) {
    return CustomDropDownBar(controller: loverSexualController, hintText: sexualList[0], itemArray: sexualList);
  }

  /// Speak Language
  Widget _buildLoverSpeakLanguageInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: languages,
      onChanged: (value) {
        newLoverLanguage = value;
      },
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        updateLover(context);
      },
    );
  }
}
