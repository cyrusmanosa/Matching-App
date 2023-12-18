import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/rpc_fix.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

// ignore_for_file: must_be_immutable, camel_case_types
class FixInformation extends StatelessWidget {
  FixInformation({Key? key}) : super(key: key);
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
      onTapNextButton(context);
    } else {
      print("FirstName: ${fixFirstNameController.text}");
      print("LastName: ${fixLastNameController.text}");
      print("Birth: ${fixBirthController.text}");
      print("Country: ${fixCountryController.text}");
      print("Gender: ${fixGenderController.text}");
      print("Blood: ${fixBloodController.text}");
    }
  }

  // Grpc
  void fixInformationGrpcRequest(BuildContext context) async {
    final request = CreateFixRequest(
      firstName: fixFirstNameController.text,
      lastName: fixLastNameController.text,
      birth: fixBirthController.text,
      country: fixCountryController.text,
      gender: fixGenderController.text,
      blood: fixBloodController.text,
    );
    final response = await GrpcService.client.createFix(request);
    // ignore: unnecessary_null_comparison
    if (response != null) {
      onTapNextButton(context);
      globalSessionID = response.sessionsID;
      print(globalSessionID);
    } else {
      showErrorDialog(context, "Error: validatable input data");
    }
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(errorMessage),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        // Header
        appBar: _buildHeader(context),
        body: Form(
          child: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
              child: Column(
                children: [
                  // image
                  CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 140.adaptSize,
                    width: 140.adaptSize,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // msg
                  Align(
                    alignment: Alignment.center,
                    child: Text("以下の項目は全部入力するのが必要です。", style: CustomTextStyles.bodyMediumblack),
                  ),
                  SizedBox(height: 25.v),

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("満18歳以上の独身であることを誓約します", style: theme.textTheme.bodyMedium),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: mediaQueryData.size.height / 50),

                  // Agree
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          decoration: BoxDecoration(color: appTheme.gray500, borderRadius: BorderRadiusStyle.r15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("全ての規約に同意します", style: theme.textTheme.bodyMedium),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: mediaQueryData.size.height / 25),

                  // Button
                  _buildNextPageButton(context),
                  SizedBox(height: mediaQueryData.size.height / 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Last Name
  Widget _buildfixLastNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixLastNameController,
      hintText: "山崎",
    );
  }

  /// First Name
  Widget _buildfixFirstNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixFirstNameController,
      hintText: "泰一",
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
          firstDate: DateTime(1950),
          lastDate: DateTime(DateTime.now().year, 12, 31),
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
    return CustomInputFormBar(
      controller: fixCountryController,
      hintText: "日本",
    );
  }

  /// Gender
  Widget _buildfixGenderInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixGenderController,
      hintText: "男",
    );
  }

  /// Blood
  Widget _buildfixBloodInput(BuildContext context) {
    return CustomInputFormBar(
      controller: fixBloodController,
      hintText: "O",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextPageButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: mediaQueryData.size.height / 25,
      text: "次へ",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        fixInformationGrpcRequest(context);
      },
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 10),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "基本個人情報 - A", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupPhoneoremailParttwoScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordSetup);
  }
}
