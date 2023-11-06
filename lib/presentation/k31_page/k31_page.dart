import '../k31_page/widgets/userprofilesection_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class K31Page extends StatelessWidget {
  const K31Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChatSection(context),
              SizedBox(height: 32.v),
              _buildUserProfileSection(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChatSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 163.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 41.v),
          Text(
            "チャット",
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 40.h,
        ),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 4.v,
            );
          },
          itemCount: 12,
          itemBuilder: (context, index) {
            return UserprofilesectionItemWidget();
          },
        ),
      ),
    );
  }
}
