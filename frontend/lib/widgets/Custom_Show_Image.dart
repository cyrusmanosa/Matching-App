import 'dart:io';
<<<<<<< HEAD
import 'dart:typed_data';
=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
import 'package:flutter/material.dart';

Widget customImageDesign(BuildContext context, File img, double mediaH, double mediaW) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: mediaW / 40),
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: ClipOval(
      child: Container(
        width: mediaH / 6.5,
        height: mediaH / 6.5,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Image.file(img, fit: BoxFit.cover),
      ),
    ),
  );
}
<<<<<<< HEAD

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
=======
>>>>>>> 538c5dbae4fcec00a3068062aca711dbf2f2ae8a
