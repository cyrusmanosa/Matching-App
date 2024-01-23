import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/GlobalModel.dart';
import 'package:dating_your_date/models/listData.dart';
import 'package:dating_your_date/pb/rpc_accompany.pb.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_search.pb.dart';
import 'package:dating_your_date/pb/rpc_targetList.pb.dart';
import 'package:dating_your_date/presentation/DeleteTarget.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/widgets/Custom_IconLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_Bar.dart';
import 'package:dating_your_date/widgets/Custom_dropdown_checkBox_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/Custom_App_bar.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_WarningLogoBox.dart';
import 'package:dating_your_date/widgets/Custom_Loading.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class AccompanyCondition extends StatefulWidget {
  AccompanyCondition({Key? key}) : super(key: key);

  @override
  _AccompanyConditionState createState() => _AccompanyConditionState();
}

class _AccompanyConditionState extends State<AccompanyCondition> {
  bool? haveTable;
  bool confirmBtn = false;

  TextEditingController accompanyEraController = TextEditingController();
  TextEditingController accompanySpeakLanguageController = TextEditingController();
  TextEditingController accompanyFindTypeController = TextEditingController();
  TextEditingController accompanySociabilityController = TextEditingController();
  String country = "";
  List<String> newAccompanyLanguages = [];
  Iterable<String> oldAccompanyLanguages = [];

  @override
  void initState() {
    super.initState();
    getAccompany(context);
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

  void getAccompany(BuildContext context) async {
    try {
      String? apiKeyS = await globalSession.read(key: 'SessionId');
      final request = GetAccompanyRequest(sessionID: apiKeyS);
      final response = await GrpcInfoService.client.getAccompany(request);
      setState(() {
        haveTable = true;
        accompanyEraController.text = response.ac.era.toString();
        accompanySpeakLanguageController.text = response.ac.speaklanguage.toString();
        accompanyFindTypeController.text = response.ac.findType.toString();
        accompanySociabilityController.text = response.ac.sociability.toString();
        oldAccompanyLanguages = response.ac.speaklanguage;
      });
    } on GrpcError {
      haveTable = false;
    }
  }

  Future<void> checkTargetUserTable(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    // Search
    try {
      final req = SearchRequestA(sessionID: apiKeyS);
      final rsp = await GrpcInfoService.client.searchTargetAccompany(req);
      print(rsp.resu);
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

  void checkTargetList(BuildContext context, SearchResponseA rsp) async {
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
          // check new target list not my userID
          if (newResponse.tl.target1ID != userid && newResponse.tl.target2ID != userid && newResponse.tl.target3ID != userid) {
            // check target list have a empty
            if (myResponse.tl.target1ID != 0 && myResponse.tl.target2ID != 0 && myResponse.tl.target3ID != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "相伴"),
                  fullscreenDialog: true,
                ),
              );
              break;
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "相伴"),
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
                builder: (context) => DeleteTarget(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "相伴"),
                fullscreenDialog: true,
              ),
            );
            break;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PayDone(oldData: myResponse.tl, newU: rsp.resu.resultID[i], le: rsp.resu.len, type: "相伴"),
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

  // Grpc
  void updateAccompany(BuildContext context) async {
    String? apiKeyS = await globalSession.read(key: 'SessionId');
    if (haveTable == true) {
      try {
        setState(() {
          showLoadDialog(context);
        });
        final request = UpdateAccompanyRequest(
          sessionID: apiKeyS,
          era: int.parse(accompanyEraController.text),
          speaklanguage: newAccompanyLanguages.isEmpty ? oldAccompanyLanguages : newAccompanyLanguages,
          findType: accompanyFindTypeController.text,
          sociability: accompanySociabilityController.text,
        );
        await GrpcInfoService.client.updateAccompany(request);
        await Future.delayed(Duration(seconds: 1));
        await showLogoDialog(context, "相伴の条件を更新しました", false);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
        checkTargetUserTable(context);
      } on GrpcError {
        Navigator.pop(context);
        await showErrorDialog(context, "エラー：更新用の検証可能な入力データがありません。");
        throw Exception("相伴の条件を入力中にエラーが発生しました。");
      }
    } else {
      if (!isPureNumber(accompanyEraController.text)) {
        await showErrorDialog(context, "入力した年代は数字ではありません");
      } else if (accompanyEraController.text.isEmpty) {
        await showErrorDialog(context, "年代はまだ設定していません");
      } else if (accompanyFindTypeController.text.isEmpty) {
        await showErrorDialog(context, "相伴 - タイプはまだ設定していません");
      } else if (accompanySociabilityController.text.isEmpty) {
        await showErrorDialog(context, "社交力はまだ設定していません");
      } else if (newAccompanyLanguages.isEmpty) {
        await showErrorDialog(context, "言語はまだ設定していません");
      } else {
        // Create
        try {
          setState(() {
            showLoadDialog(context);
          });
          final request = CreateAccompanyRequest(
            sessionID: apiKeyS,
            era: int.parse(accompanyEraController.text),
            speaklanguage: newAccompanyLanguages,
            findType: accompanyFindTypeController.text,
            sociability: accompanySociabilityController.text,
          );
          await GrpcInfoService.client.createAccompany(request);
          await Future.delayed(Duration(seconds: 1));
          await showLogoDialog(context, "相伴の条件を記録しました", false);
          await Future.delayed(Duration(seconds: 1));
          checkTargetUserTable(context);
        } on GrpcError {
          Navigator.pop(context);
          await showErrorDialog(context, "エラー：作成用の検証可能な入力データがありません。");
          throw Exception("相伴の条件を入力中にエラーが発生しました。");
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
        appBar: buildAppBar(context, "相伴の条件更改", true),
        resizeToAvoidBottomInset: true,
        backgroundColor: appTheme.bgColor,
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mediaW / 13, vertical: mediaH / 25),
            child: Column(
              children: [
                // Era
                CustomInputBar(titleName: "*年代:", backendPart: _buildAccompanyResetEraInput(context)),
                SizedBox(height: mediaH / 50),

                // Accompany Type
                CustomInputBar(titleName: "*相伴のタイプ:", backendPart: _buildAccompanyTypeInput(context)),
                SizedBox(height: mediaH / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildAccompanyResetSociabilityInput(context)),
                SizedBox(height: mediaH / 50),

                // Language
                CustomInputBar(titleName: "言語:", backendPart: _buildAccompanyResetSpeakLanguageInput(context)),
                SizedBox(height: mediaH / 40),
                _buildNextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetEraInput(BuildContext context) {
    return CustomInputFormBar(controller: accompanyEraController, hintText: "30");
  }

  /// Section Widget
  Widget _buildAccompanyTypeInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanyFindTypeController, hintText: accompanyType[0], itemArray: accompanyType);
  }

  /// Accompany Type
  Widget _buildAccompanyResetSpeakLanguageInput(BuildContext context) {
    return CustomMultiSelectDropDownBar(
      itemArray: languages,
      onChanged: (value) {
        newAccompanyLanguages = value;
      },
    );
  }

  /// Section Widget
  Widget _buildAccompanyResetSociabilityInput(BuildContext context) {
    return CustomDropDownBar(controller: accompanySociabilityController, hintText: socialPersonalities[0], itemArray: socialPersonalities);
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "条件確認",
      onPressed: () {
        updateAccompany(context);
      },
    );
  }
}
