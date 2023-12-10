import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_Bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:dating_your_date/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

// ignore_for_file: must_be_immutable, camel_case_types
class SignUp_1 extends StatelessWidget {
  SignUp_1({Key? key}) : super(key: key);
  TextEditingController basicLastNameInputController = TextEditingController();
  TextEditingController basicFirstNameInputController = TextEditingController();
  TextEditingController basicBirthInputController = TextEditingController();
  TextEditingController basicCountryInputController = TextEditingController();
  TextEditingController basicGenderInputController = TextEditingController();
  TextEditingController basicBloodInputController = TextEditingController();

  void fixInformationRequset(BuildContext context) async {
    var url = "http://127.0.0.1:8080/CreateFixInfo";
    var requestBody = {
      "First_Name": basicFirstNameInputController.text,
      "Last_Name": basicLastNameInputController.text,
      "Birth": basicBirthInputController.text,
      "Country": basicCountryInputController.text,
      "Gender": basicGenderInputController.text,
      "Blood": basicBloodInputController.text,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      onTapNextButton(context);
    } else {
      print("First_Name: ${basicFirstNameInputController.text}");
      print("Last_Name: ${basicLastNameInputController.text}");
      print("Birth: ${basicBirthInputController.text}");
      print("Country: ${basicCountryInputController.text}");
      print("Gender: ${basicGenderInputController.text}");
      print("Blood: ${basicBloodInputController.text}");
    }
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
              padding: EdgeInsets.only(left: 40.h, top: 65.v, right: 40.h),
              child: Column(
                children: [
                  // image
                  CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 140.adaptSize,
                    width: 140.adaptSize,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 20.v),

                  // msg
                  Align(
                    alignment: Alignment.center,
                    child: Text("以下の項目は全部入力するのが必要です。", style: CustomTextStyles.bodyMediumBlack900),
                  ),
                  SizedBox(height: 25.v),

                  // Last name
                  CustomInputBar(titleName: "姓:", backendPart: _buildBasicLastNameInput(context)),
                  SizedBox(height: 15.v),

                  // First name
                  CustomInputBar(titleName: "名:", backendPart: _buildBasicFirstNameInput(context)),
                  SizedBox(height: 15.v),

                  // Birth
                  CustomInputBar(titleName: "生年月日:", backendPart: _buildBasicBirthInput(context)),
                  SizedBox(height: 15.v),

                  // Country
                  CustomInputBar(titleName: "国籍:", backendPart: _buildBasicCountryInput(context)),
                  SizedBox(height: 15.v),

                  // Gender
                  CustomInputBar(titleName: "性別:", backendPart: _buildBasicGenderInput(context)),
                  SizedBox(height: 15.v),

                  // 血液型
                  CustomInputBar(titleName: "血液型:", backendPart: _buildBasicBloodInput(context)),
                  SizedBox(height: 20.v),

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
                  SizedBox(height: 15.v),

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

                  SizedBox(height: 40.v),

                  // Button
                  _buildNextButton(context),
                  SizedBox(height: 30.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Last Name
  Widget _buildBasicLastNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicLastNameInputController,
      hintText: "山崎",
    );
  }

  /// First Name
  Widget _buildBasicFirstNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicFirstNameInputController,
      hintText: "泰一",
    );
  }

  /// Birth
  Widget _buildBasicBirthInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicBirthInputController,
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
          basicBirthInputController.text = formattedDate;
        }
      },
    );
  }

  /// Country
  Widget _buildBasicCountryInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicCountryInputController,
      hintText: "日本",
    );
  }

  /// Gender
  Widget _buildBasicGenderInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicGenderInputController,
      hintText: "男",
    );
  }

  /// Blood
  Widget _buildBasicBloodInput(BuildContext context) {
    return CustomTextFormField(
      controller: basicBloodInputController,
      hintText: "O",
      textInputAction: TextInputAction.done,
    );
  }

  /// Next Button
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 90,
      height: 40,
      text: "次へ",
      buttonTextStyle: theme.textTheme.titleMedium,
      onPressed: () {
        fixInformationRequset(context);
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
    Navigator.pushNamed(context, AppRoutes.signUp_2);
  }
}
