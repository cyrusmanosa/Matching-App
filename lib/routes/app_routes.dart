import 'package:cyrus_man_s_application1/presentation/appNavigationScreen.dart';

import 'package:cyrus_man_s_application1/presentation/Chat/Chat.dart';
import 'package:cyrus_man_s_application1/presentation/ChatBox.dart';
import 'package:cyrus_man_s_application1/presentation/CompanionshipConditions.dart';
import 'package:cyrus_man_s_application1/presentation/CompanionshipConditionsRepair.dart';
import 'package:cyrus_man_s_application1/presentation/ConfirmationCore.dart';
import 'package:cyrus_man_s_application1/presentation/ConfirmationCore_Error.dart';
import 'package:cyrus_man_s_application1/presentation/ContainerScreen.dart';

import 'package:cyrus_man_s_application1/presentation/DeleteTarget.dart';

import 'package:cyrus_man_s_application1/presentation/EmailConfirmation.dart';
import 'package:cyrus_man_s_application1/presentation/EmailConfirmation_Error.dart';

import 'package:cyrus_man_s_application1/presentation/Home/Home.dart';
import 'package:cyrus_man_s_application1/presentation/HobbyCondition.dart';
import 'package:cyrus_man_s_application1/presentation/HobbyConditionRepair.dart';

import 'package:cyrus_man_s_application1/presentation/Login.dart';
import 'package:cyrus_man_s_application1/presentation/LowPercentageHeightWarnning.dart';
import 'package:cyrus_man_s_application1/presentation/LoverConditionsRepair.dart';
import 'package:cyrus_man_s_application1/presentation/LoverConditions.dart';
import 'package:cyrus_man_s_application1/presentation/LowPercentageLowWarnning.dart';

import 'package:cyrus_man_s_application1/presentation/NewPassword_Done.dart';
import 'package:cyrus_man_s_application1/presentation/NewPassword_Error.dart';
import 'package:cyrus_man_s_application1/presentation/NewPassword_Setup.dart';
import 'package:cyrus_man_s_application1/presentation/NewTargetReady.dart';

import 'package:cyrus_man_s_application1/presentation/PayDone.dart';
import 'package:cyrus_man_s_application1/presentation/PasswordReset_Email.dart';
import 'package:cyrus_man_s_application1/presentation/PasswordReset_Error.dart';
import 'package:cyrus_man_s_application1/presentation/Profile/Profile.dart';
import 'package:cyrus_man_s_application1/presentation/ProfileEdit.dart';

import 'package:cyrus_man_s_application1/presentation/SearchTitle.dart';

import 'package:cyrus_man_s_application1/presentation/SideBar.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_1.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_3.dart';
import 'package:cyrus_man_s_application1/presentation/Signup_2.dart';
import 'package:cyrus_man_s_application1/presentation/WarningDeleteUser.dart';
import 'package:cyrus_man_s_application1/presentation/WarningReturnResetPage.dart';
import 'package:cyrus_man_s_application1/presentation/TargetReady.dart';
import 'package:cyrus_man_s_application1/presentation/Target/Target.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String chat = '/chat';
  static const String chatBox = '/ChatBox';
  static const String containerScreen = '/containerScreen';
  static const String confirmationCore = '/confirmationCore';
  static const String confirmationCoreError = '/confirmationCoreError';
  static const String companionshipConditions = '/companionshipConditions';
  static const String companionshipConditionsRepair =
      '/companionshipConditionsRepair';
  static const String deleteTarget = '/deleteTarget';
  static const String emailConfirmation = '/emailConfirmation';
  static const String emailConfirmationError = '/emailConfirmationError';
  static const String login = '/login';
  static const String lowPercentageHeightWarnning =
      '/lowPercentageHeightWarnning';
  static const String lowPercentageLowWarnning = '/lowPercentageLowWarnning';
  static const String loverConditions = '/loverConditions';
  static const String loverConditionsRepair = '/loverConditionsRepair';
  static const String home = '/home';
  static const String hobbyCondition = '/hobbyCondition';
  static const String hobbyConditionRepair = '/hobbyConditionRepair';
  static const String newPasswordError = '/newPasswordError';
  static const String newPasswordSetup = '/newPasswordSetup';
  static const String newPasswordDone = '/newPasswordDone';
  static const String newTargetReady = '/newTargetReady';
  static const String passwordResetError = '/passwordResetError';
  static const String passwordResetEmail = '/passwordResetEmail';
  static const String payDone = '/payDone';
  static const String profile = '/profile';
  static const String profileEdit = '/profileEdit';
  static const String searchTitle = '/searchTitle';
  static const String sideBar = '/sideBar';
  static const String signUp_1 = '/signUp_1';
  static const String signUp_2 = '/signUp_2';
  static const String signUp_3 = '/signUp_3';
  static const String target = '/target';
  static const String targetReady = '/targetReady';
  static const String warningDeleteUser = '/warningDeleteUser';
  static const String warningReturnResetPage = '/warningReturnResetPage';

  static Map<String, WidgetBuilder> routes = {
    appNavigationScreen: (context) => AppNavigationScreen(),
    chat: (context) => Chat(),
    chatBox: (context) => ChatBox(),
    containerScreen: (context) => ContainerScreen(),
    companionshipConditions: (context) => CompanionshipConditions(),
    companionshipConditionsRepair: (context) => CompanionshipConditionsRepair(),
    confirmationCore: (context) => ConfirmationCore(),
    confirmationCoreError: (context) => ConfirmationCoreError(),
    deleteTarget: (context) => DeleteTarget(),
    emailConfirmation: (context) => EmailConfirmation(),
    emailConfirmationError: (context) => EmailConfirmationError(),
    hobbyCondition: (context) => HobbyCondition(),
    hobbyConditionRepair: (context) => HobbyConditionRepair(),
    home: (context) => Home(),
    login: (context) => Login(),
    lowPercentageHeightWarnning: (context) => LowPercentageHeightWarnning(),
    lowPercentageLowWarnning: (context) => LowPercentageLowWarnning(),
    loverConditions: (context) => LoverConditions(),
    loverConditionsRepair: (context) => LoverConditionsRepair(),
    newPasswordDone: (context) => NewPasswordDone(),
    newPasswordError: (context) => NewPasswordError(),
    newPasswordSetup: (context) => NewPasswordSetup(),
    newTargetReady: (context) => NewTargetReady(),
    passwordResetError: (context) => PasswordResetError(),
    passwordResetEmail: (context) => PasswordResetEmail(),
    payDone: (context) => PayDone(),
    profile: (context) => Profile(),
    profileEdit: (context) => ProfileEdit(),
    searchTitle: (context) => SearchTitle(),
    sideBar: (context) => SideBar(),
    signUp_1: (context) => SignUp_1(),
    signUp_2: (context) => SignUp_2(),
    signUp_3: (context) => SignUp_3(),
    target: (context) => Target(),
    targetReady: (context) => TargetReady(),
    warningDeleteUser: (context) => WarningDeleteUser(),
    warningReturnResetPage: (context) => WarningReturnResetPage()
  };
}
