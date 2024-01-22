import 'dart:typed_data';
import 'package:dating_your_date/pb/canChange.pb.dart';
import 'package:dating_your_date/pb/fix.pb.dart';
import 'package:dating_your_date/presentation/InformationEdit.dart';
import 'package:dating_your_date/widgets/button/custom_outlined_button.dart';
import 'Profile/widgets/showDataBar.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Information extends StatefulWidget {
  Information({Key? key, this.canData, this.fixData, this.imgIcon}) : super(key: key);

  final CanChange? canData;
  final List<Uint8List>? imgIcon;
  final Fix? fixData;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    double _containerHeight = 0.7;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;

    return GestureDetector(
      onVerticalDragDown: (_) {},
      onVerticalDragUpdate: (details) {
        setState(() {
          _containerHeight += details.primaryDelta! / mediaH;
          _containerHeight = _containerHeight.clamp(0.3, 1.0);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.height * _containerHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: mediaH / 15, top: mediaH / 30),
                  child: Column(
                    children: [
                      Text("マイプロフィール", style: CustomTextStyles.infoTitle),
                      _buildPart1(context, mediaH, mediaW),
                      Text("基本情報", style: CustomTextStyles.infoTitle),
                      _buildPart2(context, mediaH, mediaW),
                      SizedBox(height: mediaH / 30),
                      _buildEditButton(context, widget.canData!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Part 1
  Widget _buildPart1(BuildContext context, double mediaH, double mediaW) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaW / 10, vertical: mediaH / 30),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadiusStyle.r15,
          boxShadow: [BoxShadow(color: appTheme.grey800.withOpacity(0.4), blurRadius: 5, offset: Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("自己紹介", style: CustomTextStyles.showDataTitle),
            Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.grey)))),
            Text(widget.canData!.introduce, style: CustomTextStyles.smallTitle20),
            SizedBox(height: mediaH / 30),

            // gender
            ShownDataBarWidget(item: "性別", data: widget.fixData!.gender),
            SizedBox(height: mediaH / 40),

            // birth
            ShownDataBarWidget(item: "生年月日", data: widget.fixData!.birth),
            SizedBox(height: mediaH / 40),

            // constellations
            ShownDataBarWidget(item: "星座", data: widget.fixData!.constellation),
            SizedBox(height: mediaH / 40),

            // Country
            ShownDataBarWidget(item: "国籍", data: widget.fixData!.country),
            SizedBox(height: mediaH / 40),

            // blood
            ShownDataBarWidget(item: "血液型", data: widget.fixData!.blood),
            SizedBox(height: mediaH / 100),

            // Word
            Text("＊マイプロフィールの資料は変更できません。", style: CustomTextStyles.wordOnlySmallButton),
          ],
        ),
      ),
    );
  }

  /// Part 2
  Widget _buildPart2(BuildContext context, double mediaH, double mediaW) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaW / 10, vertical: mediaH / 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: appTheme.grey100,
          borderRadius: BorderRadiusStyle.r15,
          boxShadow: [BoxShadow(color: appTheme.grey800.withOpacity(0.4), blurRadius: 5, offset: Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nick Name
            ShownDataBarWidget(item: "ニックネーム", data: widget.canData!.nickName),
            SizedBox(height: mediaH / 40),
            // height
            ShownDataBarWidget(item: " 身長 - cm", data: widget.canData!.height.toString() + " CM"),
            SizedBox(height: mediaH / 40),
            // weight
            ShownDataBarWidget(item: " 体重 - kg", data: widget.canData!.weight.toString() + " KG"),
            SizedBox(height: mediaH / 40),
            // address
            ShownDataBarWidget(item: "居住地", data: widget.canData!.city),
            SizedBox(height: mediaH / 40),
            // education
            ShownDataBarWidget(item: "学歴", data: widget.canData!.education),
            SizedBox(height: mediaH / 40),
            // hobby
            // TODO: 1
            ShownDataBarWidget(item: "趣味 - タイプ", data: widget.canData!.hobbyType),
            SizedBox(height: mediaH / 40),
            // job
            ShownDataBarWidget(item: "職種", data: widget.canData!.job),
            SizedBox(height: mediaH / 40),
            // sexual
            ShownDataBarWidget(item: "性的指向", data: widget.canData!.sexual),
            SizedBox(height: mediaH / 40),

            // sociability
            ShownDataBarWidget(item: "社交力", data: widget.canData!.sociability),
            SizedBox(height: mediaH / 40),

            // find target
            // TODO: 2
            ShownDataBarWidget(item: "相伴のタイプ", data: widget.canData!.accompanyType),
            SizedBox(height: mediaH / 40),

            // religious
            ShownDataBarWidget(item: "宗教", data: widget.canData!.religious),
            SizedBox(height: mediaH / 100),
          ],
        ),
      ),
    );
  }

  /// button
  Widget _buildEditButton(BuildContext context, CanChange data) {
    return CustomOutlinedButton(
      text: "編集",
      onPressed: () {
        onTapNextPage(context, data);
      },
    );
  }

  void onTapNextPage(BuildContext context, CanChange request) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InformationEdit(canData: request, imgIcon: widget.imgIcon, country: widget.fixData!.country),
          fullscreenDialog: true),
    );
  }
}
