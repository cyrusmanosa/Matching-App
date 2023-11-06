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
          decoration: AppDecoration.fillPrimary,
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 40.v),
                    decoration: AppDecoration.fillPurpleA,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [_buildMainFrame(context)],
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

  /// Home Header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 176.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20.v),
          Text(
            "ホーム",
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  /// MainUserSide
  Widget _buildMainFrame(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 600.v,
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
    );
  }
}
