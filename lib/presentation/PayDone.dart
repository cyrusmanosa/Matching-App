import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class PayDone extends StatelessWidget {
  const PayDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.containerScreen);
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 65.v),
          child: Column(
            children: [
              // Logo
              CustomImageView(imagePath: ImageConstant.imgLogo, height: 80, width: 95),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, height: 17, width: 100),
              Spacer(
                flex: 28,
              ),

              // Title
              Text("お支払いOK", style: CustomTextStyles.displayMediumMontserrat),
              Spacer(flex: 70),
            ],
          ),
        ),
      ),
    );
  }
}
