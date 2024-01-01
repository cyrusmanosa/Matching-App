import 'widgets/HomeUserSide.dart';
import 'package:dating_your_date/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildMainFrame(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 176, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SizedBox(height: mediaQueryData.size.height / 20), Text("ホーム", style: theme.textTheme.headlineMedium)],
      ),
    );
  }

// User Side Show
  Widget _buildMainFrame(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: mediaQueryData.size.height / 30),
        SizedBox(
          height: mediaQueryData.size.height / 1.5,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 11),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: mediaQueryData.size.width / 22),
            itemCount: 3,
            itemBuilder: (context, index) {
              return MainframeItemWidget();
            },
          ),
        ),
      ],
    );
  }
}
