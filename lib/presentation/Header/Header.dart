import '../Header/widgets/mainframe_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
                      children: [
                        SizedBox(height: 62.v),
                        _buildMainFrame(context),
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
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 176.h,
        vertical: 15.v,
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

  /// Section Widget
  Widget _buildMainFrame(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 600.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 39.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 15.h,
            );
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
