import 'package:flutter/material.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/presentation/Target/widgets/ResetTargetButton.dart';

// ignore: must_be_immutable
class Target extends StatelessWidget {
  static List<TargetInfo> targetList = [
    TargetInfo(title: "趣味", style: CustomButtonStyles.fillDarkGray, sendPage: AppRoutes.hobbyCondition),
    TargetInfo(title: "お相伴", style: CustomButtonStyles.fillScallopSeashell, sendPage: AppRoutes.accompanyCondition),
    TargetInfo(title: "恋人", style: CustomButtonStyles.fillPink, sendPage: AppRoutes.loverCondition),
  ];

  Target({Key? key, this.head}) : super(key: key);

  String? head;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: Container(
        child: Column(
          children: [
            if (head! == "head") _buildHeader(context, mediaH, mediaW),
            if (head! == "logo") _buildLogo(context, mediaH, mediaW),
            SizedBox(height: mediaH / 30),
            Text("探すターゲットの種類", style: CustomTextStyles.profileData),
            _buildTargetResetList(context, mediaH, mediaW),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetResetList(BuildContext context, double mediaH, double mediaW) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaW / 10),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: targetList.length,
          itemBuilder: (context, index) {
            final targetInfo = targetList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: mediaH / 60),
              child: ResetTargetButton(title: targetInfo.title, color: targetInfo.style, sendPage: targetInfo.sendPage),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, double mediaH, double mediaW) {
    return Column(
      children: [
        SizedBox(height: mediaH / 10),
        CustomImageView(imagePath: ImageConstant.imgLogo, width: mediaW / 3.5),
        CustomImageView(imagePath: ImageConstant.imgSlogan, width: mediaW / 3),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, double mediaH, double mediaW) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: mediaH / 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("ターゲット更新", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900))],
        ),
      ),
    );
  }
}

class TargetInfo {
  final String title;
  final ButtonStyle style;
  final String sendPage;

  TargetInfo({required this.title, required this.style, required this.sendPage});
}
