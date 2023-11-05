import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class newPasswordDone extends StatelessWidget {
  const newPasswordDone({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 19.h,
            top: 65.v,
            right: 19.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 81.v,
                width: 95.h,
              ),
              SizedBox(height: 1.v),
              CustomImageView(
                imagePath: ImageConstant.imgSlogan,
                height: 17.v,
                width: 100.h,
              ),
              SizedBox(height: 56.v),
              Text(
                "新しいパスワード設定しました",
                style: CustomTextStyles.headlineMediumBlack900,
              ),
              SizedBox(height: 27.v),
              SizedBox(
                width: 260.h,
                child: Text(
                  "次回から新しいパスワードで\nログインできます。",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
