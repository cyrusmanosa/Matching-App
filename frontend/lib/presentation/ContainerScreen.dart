import 'package:dating_your_date/widgets/button/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerScreen extends StatefulWidget {
  ContainerScreen({Key? key, this.number, this.page}) : super(key: key);

  final int? number;
  final List<Widget>? page;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.page![selectedIndex],
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
