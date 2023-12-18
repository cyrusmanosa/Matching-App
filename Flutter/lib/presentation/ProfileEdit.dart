import 'package:dating_your_date/client/grpc_services.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/global_variable/model.dart';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/rpc_canChange.pb.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_leading_image.dart';
import 'package:dating_your_date/widgets/app_bar/appbar_title.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/app_bar/custom_app_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);

  TextEditingController updateBasicNickNameController = TextEditingController();
  TextEditingController updateBasicCityController = TextEditingController();
  TextEditingController updateBasicSexualController = TextEditingController();
  TextEditingController updateBasicHeightController = TextEditingController();
  TextEditingController updateBasicWeightController = TextEditingController();
  TextEditingController updateBasicEducationController = TextEditingController();
  TextEditingController updateBasicJobController = TextEditingController();
  TextEditingController updateBasicAnnualSalaryController = TextEditingController();
  TextEditingController updateBasicSociabilityController = TextEditingController();
  TextEditingController updateBasicReligiousController = TextEditingController();
  TextEditingController updateBasicIntroduceController = TextEditingController();

  // Grpc
  Future<CanChange> getCanChangeGrpcRequest(BuildContext context) async {
    final request = GetCanChangeRequest(sessionID: globalSessionID);
    final response = await GrpcService.client.getCanChange(request);
    // ignore: unnecessary_null_comparison
    if (response == null) {
      showErrorDialog(context, "Error: validatable input data");
    }
    return response.canChangeInfo;
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
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
        // 鍵盤彈出時調整頁面
        resizeToAvoidBottomInset: false,
        appBar: _buildHeader(context),
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                // photos
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorgray500,
                      height: 150.adaptSize,
                      width: 150.adaptSize,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPhotoSet,
                      height: 170.v,
                      width: 50.h,
                      margin: EdgeInsets.only(left: 22.h),
                    ),
                  ],
                ),

                // Introduce
                CustomInputBar(titleName: "自己紹介:", backendPart: _buildUpdateBasicIntroduceInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Nickname
                CustomInputBar(titleName: "ニックネーム:", backendPart: _buildUpdateBasicNickNameInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Height
                CustomInputBar(titleName: "身長:", backendPart: _buildUpdateBasicHeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Weight
                CustomInputBar(titleName: "体重:", backendPart: _buildUpdateBasicWeightInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // City
                CustomInputBar(titleName: "居住地:", backendPart: _buildUpdateBasicCityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Education
                CustomInputBar(titleName: "学歴:", backendPart: _buildUpdateBasicEducationInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Job
                CustomInputBar(titleName: "職種:", backendPart: _buildUpdateBasicJobInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Annual Salary
                CustomInputBar(titleName: "年収:", backendPart: _buildUpdateBasicAnnualSalaryInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sexual
                CustomInputBar(titleName: "性的指向:", backendPart: _buildUpdateBasicSexualInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Sociability
                CustomInputBar(titleName: "社交力:", backendPart: _buildUpdateBasicSociabilityInput(context)),
                SizedBox(height: mediaQueryData.size.height / 50),

                // Relighious
                CustomInputBar(titleName: "宗教:", backendPart: _buildUpdateBasicReligiousInput(context)),
                SizedBox(height: mediaQueryData.size.height / 25),

                // button
                _buildSubmitButton(context),
                SizedBox(height: mediaQueryData.size.height / 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return CustomAppBar(
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25, top: 50, bottom: 20),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "プロフィール編集", margin: EdgeInsets.only(top: 60, bottom: 20)),
      styleType: Style.bgFill,
    );
  }

  // turn back
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Nickname
  Widget _buildUpdateBasicNickNameInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicNickNameController,
      hintText: "仆街",
    );
  }

  /// City
  Widget _buildUpdateBasicCityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicCityController,
      hintText: "大阪",
    );
  }

  /// Sexual
  Widget _buildUpdateBasicSexualInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicSexualController,
      hintText: "異性愛",
    );
  }

  /// Height
  Widget _buildUpdateBasicHeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicHeightController,
      hintText: "170cm",
    );
  }

  /// Weight
  Widget _buildUpdateBasicWeightInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicWeightController,
      hintText: "60kg",
    );
  }

  /// Education
  Widget _buildUpdateBasicEducationInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicEducationController,
      hintText: "高校生",
    );
  }

  /// Job
  Widget _buildUpdateBasicJobInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicJobController,
      hintText: "ホスト",
      textInputAction: TextInputAction.done,
    );
  }

  /// Annual Salary
  Widget _buildUpdateBasicAnnualSalaryInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicAnnualSalaryController,
      hintText: "4000",
    );
  }

  /// Sociability
  Widget _buildUpdateBasicSociabilityInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicSociabilityController,
      hintText: "人たら神",
    );
  }

  /// Religious
  Widget _buildUpdateBasicReligiousInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicReligiousController,
      hintText: "多神教",
    );
  }

  /// Introduce
  Widget _buildUpdateBasicIntroduceInput(BuildContext context) {
    return CustomInputFormBar(
      controller: updateBasicIntroduceController,
      hintText: "亜dさdさだだ",
      textInputAction: TextInputAction.done,
      maxLines: 5,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
    );
  }

  /// button
  Widget _buildSubmitButton(BuildContext context) {
    return CustomOutlinedButton(
      width: mediaQueryData.size.width / 4,
      height: 40,
      text: "確認",
      buttonTextStyle: theme.textTheme.titleMedium,
    );
  }
}
