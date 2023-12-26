import 'package:dating_your_date/core/app_export.dart';
import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/AccompanyConditionRepair.dart';
import 'package:dating_your_date/presentation/DeleteTarget.dart';
import 'package:dating_your_date/presentation/HobbyConditionRepair.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/LoverConditionRepair.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/ProfileEdit.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class ContainerScreen extends StatelessWidget {
  ContainerScreen({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.home,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.home;
      case BottomBarEnum.tf1:
        return AppRoutes.target;
      case BottomBarEnum.tf2:
        return AppRoutes.chat;
      case BottomBarEnum.tf3:
        return AppRoutes.profile;
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home:
        return Home();
      case AppRoutes.target:
        return Target();
      case AppRoutes.chat:
        return Chat();
      case AppRoutes.profile:
        return Profile();
      case AppRoutes.chatBox:
        return ChatBox();
      case AppRoutes.profileEdit:
        return ProfileEdit();
      case AppRoutes.accompanyConditionRepair:
        return AccompanyConditionRepair();
      case AppRoutes.hobbyConditionRepair:
        return HobbyConditionRepair();
      case AppRoutes.loverConditionRepair:
        return LoverConditionRepair();
      case AppRoutes.deleteTarget:
        return DeleteTarget();
      default:
        return DefaultWidget();
    }
  }
}
