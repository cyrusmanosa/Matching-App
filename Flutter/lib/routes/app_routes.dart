import 'package:dating_your_date/presentation/AccompanyCondition.dart';
import 'package:dating_your_date/presentation/ContactPage.dart';
import 'package:dating_your_date/presentation/HobbyCondition.dart';
import 'package:dating_your_date/presentation/LoverCondition.dart';
import 'package:dating_your_date/presentation/Password_Setup.dart';
import 'package:dating_your_date/presentation/Information.dart';
import 'package:dating_your_date/presentation/appNavigationScreen.dart';
import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/ChatBox.dart';
import 'package:dating_your_date/presentation/SignUp_ConfirmationCore.dart';
import 'package:dating_your_date/presentation/ContainerScreen.dart';
import 'package:dating_your_date/presentation/DeleteTarget.dart';
import 'package:dating_your_date/presentation/SignUp_EmailConfirmation.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/Login.dart';
import 'package:dating_your_date/presentation/LowPercentageHeightWarnning.dart';
import 'package:dating_your_date/presentation/LowPercentageLowWarnning.dart';
import 'package:dating_your_date/presentation/NewPassword_Setup.dart';
import 'package:dating_your_date/presentation/NewTargetReady.dart';
import 'package:dating_your_date/presentation/PayDone.dart';
import 'package:dating_your_date/presentation/PasswordReset_Email.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/InformationEdit.dart';
import 'package:dating_your_date/presentation/SideBar.dart';
import 'package:dating_your_date/presentation/FixInformation.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_2.dart';
import 'package:dating_your_date/presentation/CanChangeInformation_1.dart';
import 'package:dating_your_date/presentation/TargetReady.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String appNavigationScreen = '/app_navigation_screen';
  static String chat = '/chat';
  static String chatBox = '/ChatBox';
  static String containerScreen = '/containerScreen';
  static String confirmationCore = '/confirmationCore';
  static String contactPage = '/ContactPage';
  static String accompanyCondition = '/AccompanyCondition';
  static String deleteTarget = '/deleteTarget';
  static String emailConfirmation = '/emailConfirmation';
  static String information = '/information';
  static String loadingPage = '/loadingPage';
  static String login = '/login';
  static String lowPercentageHeightWarnning = '/lowPercentageHeightWarnning';
  static String lowPercentageLowWarnning = '/lowPercentageLowWarnning';
  static String loverCondition = '/loverCondition';
  static String home = '/home';
  static String hobbyCondition = '/hobbyCondition';
  static String newPasswordSetup = '/newPasswordSetup';
  static String newTargetReady = '/newTargetReady';
  static String passwordSetup = '/passwordSetup';
  static String passwordResetEmail = '/passwordResetEmail';
  static String payDone = '/payDone';
  static String profile = '/profile';
  static String informationEdit = '/InformationEdit';
  static String targetFirstTime = '/sargetFirstTime';
  static String sideBar = '/sideBar';
  static String fixInformation = '/fixInformation';
  static String canChangeInformation_1 = '/canChangeInformation_1';
  static String canChangeInformation_2 = '/canChangeInformation_2';
  static String target = '/target';
  static String targetReady = '/targetReady';
  static String warningMsgDeleteUser = '/WarningMsgDeleteUser';
  static String warningMsgReturnResetPage = '/WarningMsgReturnResetPage';

  static Map<String, WidgetBuilder> routes = {
    appNavigationScreen: (context) => AppNavigationScreen(),
    chat: (context) => Chat(),
    chatBox: (context) => ChatBox(),
    containerScreen: (context) => ContainerScreen(number: 0),
    confirmationCore: (context) => ConfirmationCore(),
    contactPage: (context) => ContactPage(),
    deleteTarget: (context) => DeleteTarget(),
    emailConfirmation: (context) => EmailConfirmation(),
    home: (context) => Home(),
    hobbyCondition: (context) => HobbyCondition(),
    loverCondition: (context) => LoverCondition(),
    accompanyCondition: (context) => AccompanyCondition(),
    information: (context) => Information(),
    login: (context) => Login(),
    lowPercentageHeightWarnning: (context) => LowPercentageHeightWarnning(),
    lowPercentageLowWarnning: (context) => LowPercentageLowWarnning(),
    newPasswordSetup: (context) => NewPasswordSetup(),
    newTargetReady: (context) => NewTargetReady(),
    passwordSetup: (context) => PasswordSetup(),
    passwordResetEmail: (context) => PasswordResetEmail(),
    payDone: (context) => PayDone(),
    profile: (context) => Profile(),
    informationEdit: (context) => InformationEdit(),
    sideBar: (context) => SideBar(),
    fixInformation: (context) => FixInformation(),
    canChangeInformation_1: (context) => CanChangeInformation_1(),
    canChangeInformation_2: (context) => CanChangeInformation_2(),
    target: (context) => Target(),
    targetReady: (context) => TargetReady(),
  };
}
