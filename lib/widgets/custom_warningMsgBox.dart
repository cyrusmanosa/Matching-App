import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class CustomWarningMsgBox extends StatelessWidget {
  const CustomWarningMsgBox({Key? key, this.title, this.msg, this.page}) : super(key: key);

  final String? title;
  final String? msg;
  final Widget? page;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 15.h, top: 200.v, right: 15.h),
          child: Column(
            children: [
              SizedBox(height: 5.v),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 20.v),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.r30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(imagePath: ImageConstant.imgWarning, height: 40, width: 50, alignment: Alignment.center),
                    SizedBox(height: 10.v),
                    Text(msg!, style: CustomTextStyles.bodyLargeBlack900),
                    SizedBox(height: 15.v),

                    // button
                    CustomOutlinedButton(
                      height: 40,
                      width: 95,
                      text: title!,
                      buttonTextStyle: theme.textTheme.titleSmall!,
                      onPressed: () {
                        // ignore: unnecessary_statements
                        page;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
