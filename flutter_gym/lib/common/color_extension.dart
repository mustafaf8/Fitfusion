import 'package:flutter/material.dart';

class TColor {
  static Color get primryColor1 => const Color(0xff92A3FD);
  static Color get primryColor2 => const Color(0xff9DCEFF);

  static Color get scondaryColor1 => const Color(0xffC58BF2);
  static Color get scondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primryG => [primryColor2, primryColor1];
  static List<Color> get scondaryG => [scondaryColor2, scondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightgray => const Color(0xffF7F8F8);
}
