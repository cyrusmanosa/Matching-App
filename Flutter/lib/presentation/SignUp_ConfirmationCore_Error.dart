import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/app_bar/custom_Input_bar.dart';
import 'package:dating_your_date/widgets/Custom_Outlined_Button.dart';
import 'package:dating_your_date/widgets/Custom_Input_Form_Bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfirmationCoreError extends StatelessWidget {
  ConfirmationCoreError({Key? key}) : super(key: key);

  TextEditingController confirmationCoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 13, vertical: mediaQueryData.size.height / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95, alignment: Alignment.center),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100, alignment: Alignment.center),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Error icon
              CustomImageView(imagePath: ImageConstant.imgWarning, height: 40, width: 50, alignment: Alignment.center),
              SizedBox(height: 6.v),

              // Error Slogan
              SizedBox(
                width: 336.h,
                child: Text(
                  "ご確認ください\nこのメールアドレスの認証コードが正しくありません",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ),

              // Title
              Text("以下にコードを認証してください。", style: theme.textTheme.headlineMedium),
              SizedBox(height: mediaQueryData.size.height / 50),

              // Input
              CustomInputBar(titleName: "認証コード:", backendPart: _buildConfirmationCoreInput(context)),
              SizedBox(height: 2.v),

              // reset password
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    onTapReturn(context);
                  },
                  child: Text("コードが届かない場合", style: CustomTextStyles.bodyMediumblack),
                ),
              ),
              SizedBox(height: 25.v),

              // button
              CustomOutlinedButton(
                alignment: Alignment.center,
                height: 40,
                width: 95,
                text: "認証",
                buttonTextStyle: theme.textTheme.titleMedium!,
                onPressed: () {
                  onTapNextButton(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Era
  Widget _buildConfirmationCoreInput(BuildContext context) {
    return CustomInputFormBar(
      controller: confirmationCoreController,
      hintText: "423198",
      maxLines: 1,
    );
  }

  onTapReturn(BuildContext context) {
    Navigator.pop(context);
  }

  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.fixInformation);
  }
}
