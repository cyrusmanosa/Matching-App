import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/widgets/custom_outlined_button.dart';
import 'package:cyrus_man_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EmailConfirmationError extends StatelessWidget {
  EmailConfirmationError({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 30.h, top: 65.v, right: 30.h),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 81.v,
                          width: 95.h),
                      SizedBox(height: 1.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgSlogan,
                          height: 17.v,
                          width: 100.h),
                      SizedBox(height: 31.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgWarning,
                          height: 41.v,
                          width: 49.h),
                      SizedBox(height: 6.v),
                      Container(
                          width: 322.h,
                          margin: EdgeInsets.only(left: 23.h, right: 25.h),
                          child: Text("ご確認ください\nメールアドレスのフォーマットが正しくありません",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyMediumOnPrimary)),
                      SizedBox(height: 2.v),
                      Text("メールアドレスを登録",
                          style: CustomTextStyles.headlineSmallRoundedMplus1c
                              .copyWith(decoration: TextDecoration.underline)),
                      SizedBox(height: 1.v),
                      _buildEmailInput(context),
                      SizedBox(height: 42.v),
                      CustomOutlinedButton(
                          height: 38.v,
                          width: 96.h,
                          text: "送信する",
                          margin: EdgeInsets.only(left: 130.h),
                          buttonTextStyle: theme.textTheme.titleSmall!,
                          onPressed: () {
                            onTaptf(context);
                          },
                          alignment: Alignment.centerLeft),
                      SizedBox(height: 39.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 315.h,
                              margin: EdgeInsets.only(left: 20.h, right: 33.h),
                              child: Text(
                                  "メールアドレスの受信確認が必須です。\nご登録済みのお客様にもメールアドレス受信確認をお願いしております。\n（この手続きは1回のみで、以降表示されません。）",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      CustomTextStyles.bodyMediumBlack900_1))),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("メールアドレス:", style: theme.textTheme.titleLarge),
      CustomTextFormField(
        controller: emailController,
        hintText: "example@email.com",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.emailAddress,
        decoration: InputDecoration(),
        children: [],
      )
    ]);
  }

  /// Navigates to the error3Screen when the action is triggered.
  onTaptf(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileEdit);
  }
}
