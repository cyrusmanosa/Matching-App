import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/models/model.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/pb/rpc_session.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

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

  // Http
  void fixInformationHttpRequest(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateFixInfo";
    var requestBody = {
      "FirstName": fixFirstNameController.text,
      "LastName": fixLastNameController.text,
      "Birth": fixBirthController.text,
      "Country": fixCountryController.text,
      "Gender": fixGenderController.text,
      "Blood": fixBloodController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      onTapNextPage(context);
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
      final request = CreateFixRequest(
        firstName: fixFirstNameController.text,
        lastName: fixLastNameController.text,
        birth: fixBirthController.text,
        country: fixCountryController.text,
        gender: fixGenderController.text,
        blood: fixBloodController.text,
      );
      try {
        final response = await GrpcInfoService.client.createFix(request);
        await globalSession.write(key: 'SessionId', value: response.sessionsID);
        // take user id
        String? apiKeyS = await globalSession.read(key: 'SessionId');
        final useridRequest = GetUserIDRequest(sessionID: apiKeyS);
        final useridResponse = await GrpcInfoService.client.getUserID(useridRequest);
        await globalUserId.write(key: 'UserID', value: '${useridResponse.userID}');
        onTapNextPage(context);
      } on GrpcError catch (e) {
        showErrorDialog(context, "Error: ${e.codeName}");
      }
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.r15),
          // Error Logo
          title: CustomImageView(
            imagePath: ImageConstant.imgWarning,
            height: mediaQueryData.size.height / 20,
            width: mediaQueryData.size.width / 10,
            alignment: Alignment.center,
          ),

          // Word
          content: Container(
            width: mediaQueryData.size.width / 1.1,
            child: Text(errorMessage, style: CustomTextStyles.msgWordOfMsgBox, textAlign: TextAlign.center),
          ),
          actions: [
            CustomOutlinedButton(
              text: "OK",
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: mediaQueryData.size.height / 100),
              onPressed: () {
                onTapReturn(context);
              },
            ),
          ],
        );
      },
    );
  }

  bool confirm18Btn = false;
  bool confirmAgreeBtn = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildHeader(context),
      body: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            children: [
              // image
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: mediaQueryData.size.height / 7,
                width: mediaQueryData.size.width / 3,
                alignment: Alignment.center,
              ),
              SizedBox(height: mediaQueryData.size.height / 70),

              // msg
              Align(
                alignment: Alignment.centerLeft,
                child: Text("以下の項目は全部入力するのは必要です。", style: CustomTextStyles.msgWordOfMsgBox),
              ),
              SizedBox(height: mediaQueryData.size.height / 30),

              // Last name
              CustomInputBar(titleName: "姓:", backendPart: _buildfixLastNameInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // First name
              CustomInputBar(titleName: "名:", backendPart: _buildfixFirstNameInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Birth
              CustomInputBar(titleName: "生年月日:", backendPart: _buildfixBirthInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Country
              CustomInputBar(titleName: "国籍:", backendPart: _buildfixCountryInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Gender
              CustomInputBar(titleName: "性別:", backendPart: _buildfixGenderInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // 血液型
              CustomInputBar(titleName: "血液型:", backendPart: _buildfixBloodInput(context)),
              SizedBox(height: mediaQueryData.size.height / 50),

              // 18
              InkWell(
                onTap: () {
                  setState(() {
                    confirm18Btn = !confirm18Btn;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      height: mediaQueryData.size.width / 25,
                      width: mediaQueryData.size.width / 25,
                      decoration:
                          BoxDecoration(color: confirm18Btn ? appTheme.green : appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQueryData.size.width / 50),
                      child:
                          Text("満18歳以上の独身であることを誓約します", style: confirm18Btn ? CustomTextStyles.confirmGreen : CustomTextStyles.confirmGray),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaQueryData.size.height / 150),

              // Agree
              InkWell(
                onTap: () {
                  setState(() {
                    confirmAgreeBtn = !confirmAgreeBtn;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      height: mediaQueryData.size.width / 25,
                      width: mediaQueryData.size.width / 25,
                      decoration: BoxDecoration(
                        color: confirmAgreeBtn ? appTheme.green : appTheme.gray500,
                        borderRadius: BorderRadiusStyle.r15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQueryData.size.width / 50),
                      child: Text("全ての規約に同意します", style: confirmAgreeBtn ? CustomTextStyles.confirmGreen : CustomTextStyles.confirmGray),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaQueryData.size.height / 25),
              // Button
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true, title: AppbarTitle(text: "基本個人情報 - A"));
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

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordSetup);
  }
}
