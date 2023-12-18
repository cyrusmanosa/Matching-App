import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class NewPasswordDone extends StatelessWidget {
  const NewPasswordDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 75.v),
          child: Column(
            children: [
              // logo
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                width: mediaQueryData.size.width / 4,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.v),

              // Slogan
              CustomImageView(imagePath: ImageConstant.imgSlogan, width: 150, alignment: Alignment.center),

              SizedBox(height: 75.v),

              // Title 1
              Text("新しいパスワード設定しました", style: TextStyle(fontSize: 25, color: appTheme.black)),
              SizedBox(height: 25.v),

              // Tilte 2
              SizedBox(
                width: 250,
                child: Text(
                  "次回から新しいパスワードでログインできます。",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumblack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
