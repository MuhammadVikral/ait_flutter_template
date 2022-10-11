import 'package:flutter/material.dart';

const FontWeight normalFont = FontWeight.w400;
const FontWeight mediumFont = FontWeight.w600;
const FontWeight boldFont = FontWeight.w700;

class DesignTextStyle extends TextStyle {
  const DesignTextStyle._();
  static const String satoshi = 'Satoshi';
  static const TextStyle h1Style = TextStyle(
    fontFamily: satoshi,
    fontSize: 60,
  );
  static const TextStyle body1 = TextStyle(
    fontFamily: satoshi,
    fontSize: 16,
  );
}

/// used for font type option in story book
class DFontWeight {
  final String fontName;
  final FontWeight fontWeight;

  const DFontWeight.normal(
      {this.fontName = 'Normal Font', this.fontWeight = FontWeight.w400});
  const DFontWeight.medium(
      {this.fontName = 'Medium Font', this.fontWeight = FontWeight.w600});
  const DFontWeight.bold(
      {this.fontName = 'Bold Font', this.fontWeight = FontWeight.w700});

  static List<DFontWeight> get fontWeightList => const [
        DFontWeight.normal(),
        DFontWeight.medium(),
        DFontWeight.bold(),
      ];
}
