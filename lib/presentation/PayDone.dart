import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class PayDone extends StatelessWidget {
  const PayDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 65.v),
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
              Spacer(
                flex: 28,
              ),
              Text(
                "お支払いOK",
                style: CustomTextStyles.displayMediumMontserrat,
              ),
              Spacer(
                flex: 71,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
