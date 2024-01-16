import 'package:dating_your_date/presentation/Chat/Chat.dart';
import 'package:dating_your_date/presentation/Home/Home.dart';
import 'package:dating_your_date/presentation/Profile/Profile.dart';
import 'package:dating_your_date/presentation/Target/Target.dart';
import 'package:dating_your_date/widgets/button/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
    setState(() {
      selectedIndex = widget.number!;
    });
  }

  List<Widget> page = [Home(), Target(head: "head"), Chat(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex],
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
