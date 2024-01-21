import 'dart:typed_data';
import 'package:flutter/material.dart';

Widget customImageDesign(BuildContext context, Uint8List img, double mediaH, double mediaW) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: mediaW / 40),
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: ClipOval(
      child: Container(
        width: mediaH / 6.5,
        height: mediaH / 6.5,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Image(image: MemoryImage(img), fit: BoxFit.cover),
      ),
    ),
  );
}

Widget customImageDesignImage(BuildContext context, Uint8List img, double mediaH, double mediaW) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: mediaW / 40),
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: ClipOval(
      child: Container(
          width: mediaH / 6.5,
          height: mediaH / 6.5,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Image(image: MemoryImage(img), fit: BoxFit.cover)),
    ),
  );
}
