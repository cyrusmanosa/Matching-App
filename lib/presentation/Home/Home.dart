import 'widgets/HomeUserSide.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
      padding: EdgeInsets.symmetric(horizontal: 176.h, vertical: 20.5),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20.v),
          Text("ホーム", style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }

  Widget _buildMainFrame(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        SizedBox(
          height: 600,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 40),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 15.h);
            },
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
