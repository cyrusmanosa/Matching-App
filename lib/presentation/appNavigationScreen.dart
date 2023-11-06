import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          userName: "ログイン",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.login),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "ホーム - Container",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.home),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "趣味の条件更改",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hobbyConditionRepair),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "パスワード忘れーError",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.passwordResetError),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "新しいパスワード設定ーError",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPasswordError),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "パスワード忘れ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.passwordResetEmail),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "新しいパスワード設定",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPasswordSetup),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "新しいパスワードーOK",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPasswordDone),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "恋人の条件更改",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loverConditionsRepair),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "ターゲットを削除",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.deleteTarget),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "新しいターゲットを準備しました",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newTargetReady),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "お支払いOK",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.payDone),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Warnning of Delete Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.warningDeleteUser),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "相伴の条件更改",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.companionshipConditionsRepair),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "新しい条件と合わせる条件は30％",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.lowPercentageHeightWarnning),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Warnning of Return Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.warningReturnResetPage),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "メールアドレスを登録",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.emailConfirmation),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "認証コード",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.confirmationCore),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "SignUp-PhoneOrEmail-PartOne",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUp_1),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "SignUp-PhoneOrEmail-PartTwo",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUp_2),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "SignUp-PhoneOrEmail-PartThree",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUp_3),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "趣味の条件設定",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hobbyCondition),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "メールアドレスを登録ーError",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.emailConfirmationError),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "認証コードーError",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.profileEdit),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "ターゲットの最初設定",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchTitle),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "恋人の条件設定",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loverConditions),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "ターゲットを準備しました",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.targetReady),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "相伴の条件設定",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.companionshipConditions),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "条件と合わせる条件は30％",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.lowPercentageLowWarnning),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "チャットボックス",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.chatBox),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Side Bar",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.sideBar),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "プロフィール編集",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.profileEdit),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String userName,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
