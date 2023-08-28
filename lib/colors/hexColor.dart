import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static HexColor bgDark = HexColor("#202124");
  static HexColor redNav = HexColor("#D93B23");
  static HexColor gray40 = HexColor("#CFCFCF");
  static HexColor gray60 = HexColor("#9AA0A6");
  static HexColor gray80 = HexColor("#868A90");
  static HexColor gray100 = HexColor("#303134");
}
