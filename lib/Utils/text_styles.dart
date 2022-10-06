import 'package:assign12/Utils/screen_constants.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle get blankTest => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get headingTextStyle => TextStyle(
        color: Colors.black45,
        fontSize: FontSize.s25,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get detailsTextStyle => TextStyle(
        color: Colors.black87,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get detailsHeadingTextStyle => TextStyle(
        color: Colors.black87,
        fontSize: FontSize.s25,
        fontWeight: FontWeight.bold,
      );
}
