import 'package:flutter/material.dart';

class TColor {
  //todo primary color
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xFF9DCEFF);
  //todo secondary color
  static Color get secondaryColor1 => const Color(0xFFC58BF2);
  static Color get secondaryColor2 => const Color(0xFFEEA4CE);
  //todo black
  static Color get blackColor => const Color(0xFF1D1617);
  //todo grey
  static Color get gray => const Color(0xFF7B6F72);

  //todo white
  static Color get white => const Color(0xFFFFFFFF);
  //todo
  static Color get lightGray => const Color(0xFFF7F8F8);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];
}
