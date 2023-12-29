import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});
  Function(BottomBarEnum)? onChanged;
  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    // ホーム
    BottomMenuModel(icon: ImageConstant.imgHome, activeIcon: ImageConstant.imgHome, label: "ホーム", type: BottomBarEnum.home),
    // ターゲット
    BottomMenuModel(icon: ImageConstant.imgTarget, activeIcon: ImageConstant.imgTarget, label: "ターゲット", type: BottomBarEnum.target),
    // チャット
    BottomMenuModel(icon: ImageConstant.imgChat, activeIcon: ImageConstant.imgChat, label: "チャット", type: BottomBarEnum.chat),
    // プロフィール
    BottomMenuModel(icon: ImageConstant.imgProfile, activeIcon: ImageConstant.imgProfile, label: "プロフィール", type: BottomBarEnum.profile)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryData.size.height / 13,
      decoration: BoxDecoration(color: appTheme.gray500),
      padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 15),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          // Footage
          return BottomNavigationBarItem(
            label: "",
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  width: mediaQueryData.size.width / 20,
                  color: appTheme.white,
                ),
                Padding(padding: EdgeInsets.only(top: 2.v), child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonW)),
              ],
            ),
            // Icon OnTap
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  width: mediaQueryData.size.width / 20,
                  color: appTheme.cyan600,
                ),
                Padding(padding: EdgeInsets.only(top: 2.v), child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonC)),
              ],
            ),
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type!);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum { home, target, chat, profile }

class BottomMenuModel {
  BottomMenuModel({this.label, this.activeIcon, this.icon, this.type});
  String? activeIcon;
  String? icon;
  String? label;
  BottomBarEnum? type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Please replace the respective Widget here', style: TextStyle(fontSize: 18))],
        ),
      ),
    );
  }
}
