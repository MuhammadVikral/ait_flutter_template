import 'package:flutter/material.dart';

const FontWeight normalFont = FontWeight.w400;
const FontWeight mediumFont = FontWeight.w600;
const FontWeight boldFont = FontWeight.w700;
const FontStyle normalStyle = FontStyle.normal;
const FontStyle italicStyle = FontStyle.italic;

class DesignTextStyle extends TextStyle {
  const DesignTextStyle._();
  static const String satoshi = 'Satoshi';
  static const TextStyle h1 = TextStyle(fontFamily: satoshi, fontSize: 60);
  static const TextStyle h2 = TextStyle(fontFamily: satoshi, fontSize: 48);
  static const TextStyle h3 = TextStyle(fontFamily: satoshi, fontSize: 34);
  static const TextStyle h4 = TextStyle(fontFamily: satoshi, fontSize: 28);
  static const TextStyle h5 = TextStyle(fontFamily: satoshi, fontSize: 24);
  static const TextStyle h6 = TextStyle(fontFamily: satoshi, fontSize: 20);
  static const TextStyle body1 = TextStyle(fontFamily: satoshi, fontSize: 16);
  static const TextStyle body2 = TextStyle(fontFamily: satoshi, fontSize: 14);
  static const TextStyle caption = TextStyle(fontFamily: satoshi, fontSize: 12);
}

/// used for font weight option in story book
class OFontWeight {
  final String fontName;
  final FontWeight fontWeight;

  const OFontWeight.normal(
      {this.fontName = 'Normal Font', this.fontWeight = FontWeight.w400});
  const OFontWeight.medium(
      {this.fontName = 'Medium Font', this.fontWeight = FontWeight.w600});
  const OFontWeight.bold(
      {this.fontName = 'Bold Font', this.fontWeight = FontWeight.w700});

  static List<OFontWeight> get fontWeightList => const [
        OFontWeight.normal(),
        OFontWeight.medium(),
        OFontWeight.bold(),
      ];
}

class OFontStyle {
  final String styleName;
  final FontStyle fontStyle;

  const OFontStyle.normal(
      {this.styleName = 'Normal Style', this.fontStyle = FontStyle.normal});
  const OFontStyle.italic(
      {this.styleName = 'Italic Style', this.fontStyle = FontStyle.italic});

  static List<OFontStyle> get fontStyleList => const [
        OFontStyle.normal(),
        OFontStyle.italic(),
      ];
}
