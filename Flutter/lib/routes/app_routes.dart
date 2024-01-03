import 'package:dating_your_date/presentation/Password_Setup.dart';
import 'package:dating_your_date/presentation/WarningDeleteUser.dart';
import 'package:dating_your_date/presentation/WarningReturnResetPage.dart';
import 'package:dating_your_date/presentation/appNavigationScreen.dart';
import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:dating_your_date/presentation/AccompanyCondition.dart';
import 'package:dating_your_date/presentation/AccompanyConditionRepair.dart';
import 'package:dating_your_date/presentation/SignUp_ConfirmationCore.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/presentation/DeleteTarget.dart';
import 'package:dating_your_date/presentation/SignUp_EmailConfirmation.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/HobbyCondition.dart';
import 'package:dating_your_date/presentation/HobbyConditionRepair.dart';
import 'package:dating_your_date/presentation/Login.dart';
import 'package:dating_your_date/presentation/LowPercentageHeightWarnning.dart';
import 'package:dating_your_date/presentation/LoverConditionRepair.dart';
import 'package:dating_your_date/presentation/LoverCondition.dart';
import 'package:dating_your_date/presentation/LowPercentageLowWarnning.dart';
import 'package:dating_your_date/presentation/NewPassword_Done.dart';
import 'package:dating_your_date/presentation/NewPassword_Setup.dart';
import 'package:dating_your_date/presentation/NewTargetReady.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/presentation/PasswordReset_Email.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/ProfileEdit.dart';
import 'package:dating_your_date/presentation/TargetFirstTime.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/presentation/FixInformation.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_2.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_1.dart';
import 'package:dating_your_date/presentation/TargetReady.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String chat = '/chat';
  static const String chatBox = '/ChatBox';
  static const String containerScreen = '/containerScreen';
  static const String confirmationCore = '/confirmationCore';
  static const String accompanyCondition = '/AccompanyCondition';
  static const String accompanyConditionRepair = '/AccompanyConditionRepair';
  static const String deleteTarget = '/deleteTarget';
  static const String emailConfirmation = '/emailConfirmation';
  static const String loadingPage = '/loadingPage';
  static const String login = '/login';
  static const String lowPercentageHeightWarnning = '/lowPercentageHeightWarnning';
  static const String lowPercentageLowWarnning = '/lowPercentageLowWarnning';
  static const String loverCondition = '/loverCondition';
  static const String loverConditionRepair = '/loverConditionRepair';
  static const String home = '/home';
  static const String hobbyCondition = '/hobbyCondition';
  static const String hobbyConditionRepair = '/hobbyConditionRepair';
  static const String newPasswordSetup = '/newPasswordSetup';
  static const String newPasswordDone = '/newPasswordDone';
  static const String newTargetReady = '/newTargetReady';
  static const String passwordSetup = '/passwordSetup';
  static const String passwordResetEmail = '/passwordResetEmail';
  static const String payDone = '/payDone';
  static const String profile = '/profile';
  static const String profileEdit = '/profileEdit';
  static const String targetFirstTime = '/sargetFirstTime';
  static const String sideBar = '/sideBar';
  static const String fixInformation = '/fixInformation';
  static const String canChangeInformation_1 = '/canChangeInformation_1';
  static const String canChangeInformation_2 = '/canChangeInformation_2';
  static const String target = '/target';
  static const String targetReady = '/targetReady';
  static const String warningMsgDeleteUser = '/WarningMsgDeleteUser';
  static const String warningMsgReturnResetPage = '/WarningMsgReturnResetPage';

  static Map<String, WidgetBuilder> routes = {
    appNavigationScreen: (context) => AppNavigationScreen(),
    chat: (context) => Chat(),
    chatBox: (context) => ChatBox(),
    containerScreen: (context) => ContainerScreen(),
    accompanyCondition: (context) => AccompanyCondition(),
    accompanyConditionRepair: (context) => AccompanyConditionRepair(),
    confirmationCore: (context) => ConfirmationCore(),
    deleteTarget: (context) => DeleteTarget(),
    emailConfirmation: (context) => EmailConfirmation(),
    hobbyCondition: (context) => HobbyCondition(),
    hobbyConditionRepair: (context) => HobbyConditionRepair(),
    home: (context) => Home(),
    login: (context) => Login(),
    lowPercentageHeightWarnning: (context) => LowPercentageHeightWarnning(),
    lowPercentageLowWarnning: (context) => LowPercentageLowWarnning(),
    loverCondition: (context) => LoverCondition(),
    loverConditionRepair: (context) => LoverConditionRepair(),
    newPasswordDone: (context) => NewPasswordDone(),
    newPasswordSetup: (context) => NewPasswordSetup(),
    newTargetReady: (context) => NewTargetReady(),
    passwordSetup: (context) => PasswordSetup(),
    passwordResetEmail: (context) => PasswordResetEmail(),
    payDone: (context) => PayDone(),
    profile: (context) => Profile(),
    profileEdit: (context) => ProfileEdit(),
    targetFirstTime: (context) => TargetFirstTime(),
    sideBar: (context) => SideBar(),
    fixInformation: (context) => FixInformation(),
    canChangeInformation_1: (context) => CanChangeInformation_1(),
    canChangeInformation_2: (context) => CanChangeInformation_2(),
    target: (context) => Target(),
    targetReady: (context) => TargetReady(),
    // warningMsgDeleteUser: (context) => WarningMsgDeleteUser(),
    // warningMsgReturnResetPage: (context) => WarningMsgReturnResetPage()
  };
}
