import '../Chat/widgets/userprofilesection_item_widget.dart';
import 'package:cyrus_man_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  /// Header
  Widget _buildChatSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 163.h, vertical: 11),
      decoration: AppDecoration.fillGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 40),
          Text("チャット", style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.h, right: 40.h),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return TargetSectionCheckWidget();
          },
        ),
      ),
    );
  }
}
