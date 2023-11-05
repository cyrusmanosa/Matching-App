import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cyrus_man_s_application1/theme/theme_helper.dart';
import 'package:cyrus_man_s_application1/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'cyrus_man_s_application1',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Login,
      routes: AppRoutes.routes,
    );
  }
}
