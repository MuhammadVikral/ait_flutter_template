import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DesignColors {
  const DesignColors._();
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  ///Primary Colors
  static final Color primaryLight2 = HexColor('#EFF6FF');
  static final Color primaryLight1 = HexColor('#BFDBFE');
  static final Color primaryBase = HexColor('#1D4ED8');
  static final Color primaryDark1 = HexColor('#173EAB');
  static final Color primaryDark2 = HexColor('#112D7E');

  ///Danger Colors
  static final Color dangerLight2 = HexColor('#FFE6E9');
  static final Color dangerLight1 = HexColor('#FA9FAA');
  static final Color dangerBase = HexColor('#E91639');
  static final Color dangerDark1 = HexColor('#D10026');
  static final Color dangerDark2 = HexColor('#B02132');

  ///Success Colors
  static final Color successLight2 = HexColor('#CFF6E8');
  static final Color successLight1 = HexColor('#5EE1B2');
  static final Color successBase = HexColor('#09C380');
  static final Color successDark1 = HexColor('#069D66');
  static final Color successDark2 = HexColor('#098C5D');

  ///Color Option for StoryBook
  static List<Color> get colorList => [
        black,
        white,
        primaryLight2,
        primaryLight1,
        primaryBase,
        primaryDark1,
        primaryDark2,
        dangerLight2,
        dangerLight1,
        dangerBase,
        dangerDark1,
        dangerDark2,
        successLight2,
        successLight1,
        successBase,
        successDark1,
        successDark2,
      ];
  static List<Color> get colorListBG => [
        white,
        black,
      ];
}
