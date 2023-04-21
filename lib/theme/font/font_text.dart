import 'package:flutter/material.dart';

class FontText{
  static TextStyle header  = const TextStyle(fontWeight: FontWeight.bold, fontSize: 27);
  static TextStyle title  = const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle titleLarge = const TextStyle(fontWeight: FontWeight.bold, fontSize: 29);
  static TextStyle headerCard  = const TextStyle(fontWeight: FontWeight.bold, fontSize: 17);
  static TextStyle labelLarge = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle bodyMedium = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle bodySmall = const TextStyle(fontSize: 11, fontWeight: FontWeight.w400);
}

class AppColor {
  static Color primary = Colors.blue;
  static Color normal = Colors.black;
  static Color silver = const Color(0xffEFEFEF);
  static Color outline = const Color(0xFF707070);
  static Color green = const Color(0xFF3D7C45);
}

extension TextColor on TextStyle {
  TextStyle get primary => copyWith(color: AppColor.primary);
  TextStyle get normal => copyWith(color: AppColor.normal);
  TextStyle get green => copyWith(color: AppColor.green);
}