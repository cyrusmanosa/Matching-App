import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _buildAppNavigation(context),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      _buildScreenTitle(
                        context,
                        userName: "ログイン",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.login),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "ホーム - Container",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.home),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "パスワード設定",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.passwordSetup),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "パスワード忘れ",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.passwordResetEmail),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "新しいパスワード設定",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.newPasswordSetup),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "ターゲットを削除",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.deleteTarget),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "新しいターゲットを準備しました",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.newTargetReady),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "お支払いOK",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.payDone),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "Warnning of Delete Page",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.warningMsgDeleteUser),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "新しい条件と合わせる条件は30％",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.lowPercentageHeightWarnning),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "Warnning of Return Page",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.warningMsgReturnResetPage),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "メールアドレスを登録",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.emailConfirmation),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "認証コード",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.confirmationCore),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "SignUp-PhoneOrEmail-PartOne",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.fixInformation),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "SignUp-PhoneOrEmail-PartTwo",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.canChangeInformation_1),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "SignUp-PhoneOrEmail-PartThree",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.canChangeInformation_2),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "H",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.hobbyCondition),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "ターゲット",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.target),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "ターゲットの最初設定",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.targetFirstTime),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "ターゲットを準備しました",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.targetReady),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "条件と合わせる条件は30％",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.lowPercentageLowWarnning),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "チャット",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.chat),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "チャットボックス",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.chatBox),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "Side Bar",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.sideBar),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "プロフィール編集",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.informationEdit),
                      ),
                      _buildScreenTitle(
                        context,
                        userName: "プロフィール",
                        onTapScreenTitle: () => onTapScreenTitle(context, AppRoutes.profile),
                      ),
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

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return Container(
      decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
      child: Column(
        children: [
          SizedBox(height: mediaH / 25),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Check your app's UI from the below demo screens of your app.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0XFF888888), fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: 1, thickness: 1, color: Color(0XFF000000)),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(BuildContext context, {required String userName, Function? onTapScreenTitle}) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double mediaH = mediaQueryData.size.height;
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: mediaH / 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(userName, textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF000000), fontSize: 20)),
              ),
            ),
            SizedBox(height: mediaH / 50),
            Divider(height: 1, thickness: 1, color: Color(0XFF888888)),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
