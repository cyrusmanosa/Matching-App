import 'package:dating_your_date/client/chat_unread.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.selectedIndex, this.onChanged});

  final int? selectedIndex;
  final Function(int)? onChanged;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(icon: ImageConstant.imgHomeW, activeIcon: ImageConstant.imgHomeB, label: "ホーム"),
    BottomMenuModel(icon: ImageConstant.imgTargetW, activeIcon: ImageConstant.imgTargetB, label: "ターゲット"),
    BottomMenuModel(icon: ImageConstant.imgChatW, activeIcon: ImageConstant.imgChatB, label: "チャット"),
    BottomMenuModel(icon: ImageConstant.imgProfileW, activeIcon: ImageConstant.imgProfileB, label: "プロフィール"),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    double mediaW = mediaQueryData.size.width;
    return Container(
      height: mediaH / 10.3,
      width: mediaW,
      decoration: BoxDecoration(color: appTheme.pinkA100),
      child: BottomNavigationBar(
        backgroundColor: Color.fromARGB(0, 255, 0, 0),
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex!,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          bottomMenuList.length,
          (index) {
            return BottomNavigationBarItem(
              label: "",
              // before
              icon: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: mediaH / 100)),
                  _menuIcon(bottomMenuList[index].icon, index, mediaW, appTheme.white, appTheme.black),
                  Padding(padding: EdgeInsets.only(top: 2), child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonW)),
                ],
              ),

              // after
              activeIcon: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: mediaH / 100)),
                  _menuIcon(bottomMenuList[index].activeIcon, index, mediaW, appTheme.black, appTheme.white),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(bottomMenuList[index].label!, style: CustomTextStyles.mainButtonC),
                  ),
                ],
              ),
            );
          },
        ),
        onTap: onChanged,
      ),
    );
  }

  Widget _menuIcon(String? path, int index, double mediaW, Color color, Color badgeColor) {
    final image = CustomImageView(imagePath: path, width: mediaW / 20, color: color);
    if (index != 2) return image;
    return ValueListenableBuilder<int>(
      valueListenable: chatUnreadCount,
      builder: (context, count, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            child!,
            if (count > 0)
              Positioned(
                right: -mediaW * 0.012,
                top: -mediaW * 0.006,
                child: Container(
                  width: mediaW * 0.022,
                  height: mediaW * 0.022,
                  decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
                ),
              ),
          ],
        );
      },
      child: image,
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({this.label, this.activeIcon, this.icon});
  String? activeIcon;
  String? icon;
  String? label;
}
