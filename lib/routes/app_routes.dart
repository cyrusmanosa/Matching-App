import 'package:cyrus_man_s_application1/presentation/appNavigationScreen.dart';
import 'package:cyrus_man_s_application1/presentation/NewPassword_Error.dart';
import 'package:cyrus_man_s_application1/presentation/Profile_Edit.dart';
import 'package:cyrus_man_s_application1/presentation/Home.dart';
import 'package:cyrus_man_s_application1/presentation/EmailConfirmation_Error.dart';
import 'package:cyrus_man_s_application1/presentation/ConfirmationCore_Error.dart';
import 'package:cyrus_man_s_application1/presentation/PasswordReset_Error.dart';
import 'package:cyrus_man_s_application1/presentation/Login.dart';
import 'package:cyrus_man_s_application1/presentation/LoverConditionsRepair.dart';
import 'package:cyrus_man_s_application1/presentation/DeleteTarget.dart';
import 'package:cyrus_man_s_application1/presentation/NewTargetReady.dart';
import 'package:cyrus_man_s_application1/presentation/CompanionshipConditionsRepair.dart';
import 'package:cyrus_man_s_application1/presentation/LowPercentageHeightWarnning.dart';
import 'package:cyrus_man_s_application1/presentation/EmailConfirmation.dart';
import 'package:cyrus_man_s_application1/presentation/ConfirmationCore.dart';
import 'package:cyrus_man_s_application1/presentation/HobbyCondition.dart';
import 'package:cyrus_man_s_application1/presentation/SearchTitle.dart';
import 'package:cyrus_man_s_application1/presentation/LoverConditions.dart';
import 'package:cyrus_man_s_application1/presentation/TargetReady.dart';
import 'package:cyrus_man_s_application1/presentation/CompanionshipConditions.dart';
import 'package:cyrus_man_s_application1/presentation/LowPercentageLowWarnning.dart';
import 'package:cyrus_man_s_application1/presentation/ChatBox.dart';
import 'package:cyrus_man_s_application1/presentation/HobbyConditionRepair.dart';
import 'package:cyrus_man_s_application1/presentation/PasswordReset_Email.dart';
import 'package:cyrus_man_s_application1/presentation/NewPassword_Setup.dart';
import 'package:cyrus_man_s_application1/presentation/PayDone.dart';
import 'package:cyrus_man_s_application1/presentation/NewPassword_Done.dart';
import 'package:cyrus_man_s_application1/presentation/SideBar.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_1.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_3.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_2.dart';
import 'package:cyrus_man_s_application1/presentation/WarningDeleteUser.dart';
import 'package:cyrus_man_s_application1/presentation/WarningReturnResetPage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String k1Page = '/k1_page';
  static const String k9Page = '/k9_page';
  static const String k31Page = '/k31_page';
  static const String k34Page = '/k34_page';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String ChatBox = '/chatBox';
  static const String ConfirmationCore = '/confirmationCore';
  static const String ConfirmationCoreError = '/confirmationCoreError';
  static const String CompanionshipConditions = '/companionshipConditions';
  static const String CompanionshipConditionsRepair =
      '/companionshipConditionsRepair';
  static const String DeleteTarget = '/deleteTarget';
  static const String EmailConfirmation = '/emailConfirmation';
  static const String EmailConfirmationError = '/emailConfirmationError';
  static const String Login = '/login';
  static const String LowPercentageHeightWarnning =
      '/lowPercentageHeightWarnning';
  static const String LowPercentageLowWarnning = '/lowPercentageLowWarnning';
  static const String LoverConditions = '/loverConditions';
  static const String LoverConditionsRepair = '/loverConditionsRepair';
  static const String Home = '/home';
  static const String HobbyCondition = '/hobbyCondition';
  static const String HobbyConditionRepair = '/hobbyConditionRepair';
  static const String PasswordResetError = '/passwordResetError';
  static const String PasswordResetEmail = '/passwordResetEmail';
  static const String ProfileEdit = '/profileEdit';
  static const String NewPasswordError = '/newPasswordError';
  static const String NewPasswordSetup = '/newPasswordSetup';
  static const String NewPasswordDone = '/newPasswordDone';
  static const String NewTargetReady = '/newTargetReady';
  static const String PayDone = '/payDone';
  static const String SearchTitle = '/searchTitle';
  static const String SideBar = '/sideBar';
  static const String SignUp_1 = '/signUp_1';
  static const String SignUp_2 = '/signUp_2';
  static const String SignUp_3 = '/signUp_3';
  static const String TargetReady = '/targetReady';
  static const String WarningDeleteUser = '/warningDeleteUser';
  static const String WarningReturnResetPage = '/warningReturnResetPage';

  static Map<String, WidgetBuilder> routes = {
    appNavigationScreen: (context) => AppNavigationScreen(),
    ChatBox: (context) => chatBox(),
    CompanionshipConditions: (context) => companionshipConditions(),
    CompanionshipConditionsRepair: (context) => companionshipConditionsRepair(),
    ConfirmationCore: (context) => confirmationCore(),
    ConfirmationCoreError: (context) => confirmationCoreError(),
    DeleteTarget: (context) => deleteTarget(),
    EmailConfirmation: (context) => emailConfirmation(),
    EmailConfirmationError: (context) => emailConfirmationError(),
    HobbyCondition: (context) => hobbyCondition(),
    HobbyConditionRepair: (context) => hobbyConditionRepair(),
    Home: (context) => home(),
    Login: (context) => login(),
    LowPercentageHeightWarnning: (context) => lowPercentageHeightWarnning(),
    LowPercentageLowWarnning: (context) => lowPercentageLowWarnning(),
    LoverConditions: (context) => loverConditions(),
    LoverConditionsRepair: (context) => loverConditionsRepair(),
    NewPasswordDone: (context) => newPasswordDone(),
    NewPasswordError: (context) => newPasswordError(),
    NewPasswordSetup: (context) => newPasswordSetup(),
    NewTargetReady: (context) => newTargetReady(),
    PasswordResetError: (context) => passwordResetError(),
    PasswordResetEmail: (context) => passwordResetEmail(),
    PayDone: (context) => payDone(),
    ProfileEdit: (context) => profileEdit(),
    SearchTitle: (context) => searchTitle(),
    SideBar: (context) => sideBar(),
    SignUp_1: (context) => signUp_1(),
    SignUp_2: (context) => signUp_2(),
    SignUp_3: (context) => signUp_3(),
    TargetReady: (context) => targetReady(),
    WarningDeleteUser: (context) => warningDeleteUser(),
    WarningReturnResetPage: (context) => warningReturnResetPage()
  };
}
