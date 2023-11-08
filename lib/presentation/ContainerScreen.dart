import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:cyrus_man_s_application1/presentation/Chat/Chat.dart';
import 'package:cyrus_man_s_application1/presentation/Home/Home.dart';
import 'package:cyrus_man_s_application1/presentation/Profile/Profile.dart';
import 'package:cyrus_man_s_application1/presentation/ProfileEdit.dart';
import 'package:cyrus_man_s_application1/presentation/Target/Target.dart';
import 'package:cyrus_man_s_application1/widgets/custom_bottom_bar.dart';
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
      case AppRoutes.profileEdit:
        return ProfileEdit();
      default:
        return DefaultWidget();
    }
  }
}
