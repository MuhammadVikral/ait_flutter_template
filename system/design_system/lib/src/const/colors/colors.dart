import 'package:flutter/material.dart';

class DesignColors {
  const DesignColors._();

  ///Neutral Colors

  static const Color white = Color(0xFFFFFFFF);
  static const Color neutral10 = Color(0xFFF5F7F9);
  static const Color neutral20 = Color(0xFFF1F3F5);
  static const Color neutral30 = Color(0xFFE9ECEF);
  static const Color neutral40 = Color(0xFFDEE2E6);
  static const Color neutral50 = Color(0xFCED4DAF);
  static const Color neutral60 = Color(0xFFADB5BD);
  static const Color neutral70 = Color(0xFF868E96);
  static const Color neutral80 = Color(0xFF495057);
  static const Color neutral90 = Color(0xFF343A40);
  static const Color black = Color(0xFF212529);

  ///Primary Colors
  static const Color primaryLight2 = Color(0xFFEFF6FF);
  static const Color primaryLight1 = Color(0xFFBFDBFE);
  static const Color primaryBase = Color(0xFF1D4ED8);
  static const Color primaryDark1 = Color(0xFF173EAB);
  static const Color primaryDark2 = Color(0xFF112D7E);

  ///Danger Colors
  static const Color dangerLight2 = Color(0xFFFFE6E9);
  static const Color dangerLight1 = Color(0xFFFA9FAA);
  static const Color dangerBase = Color(0xFFE91639);
  static const Color dangerDark1 = Color(0xFFD10026);
  static const Color dangerDark2 = Color(0xFFB02132);

  ///Success Colors
  static const Color successLight2 = Color(0xFFCFF6E8);
  static const Color successLight1 = Color(0xFF5EE1B2);
  static const Color successBase = Color(0xFF09C380);
  static const Color successDark1 = Color(0xFF069D66);
  static const Color successDark2 = Color(0xFF098C5D);

  ///Warning Colors
  static const Color warningLight2 = Color(0xFFFFEEDA);
  static const Color warningLight1 = Color(0xFFFFD5A3);
  static const Color warningBase = Color(0xFFFFA338);
  static const Color warningDark1 = Color(0xFFDC7B09);
  static const Color warningDark2 = Color(0xFFA76416);

  ///Info Colors
  static const Color infoLight2 = Color(0xFFE5DFFF);
  static const Color infoLight1 = Color(0xFFBDB0FF);
  static const Color infoBase = Color(0xFF7257FF);
  static const Color infoDark1 = Color(0xFF5B44D5);
  static const Color infoDark2 = Color(0xFF4C38B2);

  ///Color Option for StoryBook
  static List<Color> get colorList => const [
        primaryBase,
        primaryLight2,
        primaryLight1,
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
        warningLight2,
        warningLight1,
        warningBase,
        warningDark1,
        warningDark2,
        infoLight2,
        infoLight1,
        infoBase,
        infoDark1,
        infoDark2,
        neutral10,
        neutral20,
        neutral30,
        neutral40,
        neutral50,
        neutral60,
        neutral70,
        neutral80,
        neutral90,
        black,
        white,
      ];
}
