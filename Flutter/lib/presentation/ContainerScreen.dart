import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  ContainerScreen({Key? key, this.number}) : super(key: key);

  final int? number;

  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    number();
  }

  void number() {
    setState(() {
      selectedIndex = widget.number!;
    });
  }

  List<Widget> pages = [Home(), Target(head: "head"), Chat(), Profile()];
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
