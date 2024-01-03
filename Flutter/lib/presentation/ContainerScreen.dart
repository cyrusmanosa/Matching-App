import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  ContainerScreen({Key? key}) : super(key: key);

  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [Home(), Target(), Chat(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: selectedIndex,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
