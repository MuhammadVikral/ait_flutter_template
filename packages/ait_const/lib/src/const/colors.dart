import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DesignColors {
  const DesignColors._();
  static const Color black = Colors.black;
  static final Color primaryLight2 = HexColor('#EFF6FF');
  static final Color primaryLight1 = HexColor('#BFDBFE');
  static final Color primaryBase = HexColor('#1D4ED8');
  static final Color primaryDark1 = HexColor('#173EAB');
  static final Color primaryDark2 = HexColor('#112D7E');
  static List<Color> get colorList => [
        black,
        primaryLight2,
        primaryLight1,
        primaryBase,
        primaryDark1,
        primaryDark2,
      ];
}
