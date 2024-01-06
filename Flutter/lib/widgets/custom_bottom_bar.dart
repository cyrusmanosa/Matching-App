import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({required this.selectedIndex, required this.onChanged});

  final int selectedIndex;
  final Function(int) onChanged;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(icon: ImageConstant.imgHome, activeIcon: ImageConstant.imgHome, label: "ホーム"),
    BottomMenuModel(icon: ImageConstant.imgTarget, activeIcon: ImageConstant.imgTarget, label: "ターゲット"),
    BottomMenuModel(icon: ImageConstant.imgChat, activeIcon: ImageConstant.imgChat, label: "チャット"),
    BottomMenuModel(icon: ImageConstant.imgProfile, activeIcon: ImageConstant.imgProfile, label: "プロフィール"),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Container(
      height: mediaH / 10.5,
      decoration: BoxDecoration(color: appTheme.gray500),
      padding: EdgeInsets.only(
        left: mediaW / 20,
        right: mediaW / 20,
      ),
      child: BottomNavigationBar(
        backgroundColor: Color.fromARGB(0, 255, 0, 0),
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            label: "",

            // before
            icon: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: mediaH / 100)),
                CustomImageView(imagePath: bottomMenuList[index].icon, width: mediaW / 20, color: appTheme.white),
                Padding(padding: EdgeInsets.only(top: 2), child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonW)),
              ],
            ),

            // after
            activeIcon: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: mediaH / 100)),
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  width: mediaW / 20,
                  color: appTheme.cyan600,
                ),
                Padding(padding: EdgeInsets.only(top: 2), child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonC)),
              ],
            ),
          );
        }),
        onTap: onChanged,
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({this.label, this.activeIcon, this.icon});

  String? activeIcon;
  String? icon;
  String? label;
}
