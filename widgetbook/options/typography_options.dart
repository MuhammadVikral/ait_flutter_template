import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

List<Option<DesignText>> typographyOption(
    {FontWeight? fontWeight, DesignColors? color}) {
  final List<DesignText> typographys = DesignText.listTypography();
  return List<Option<DesignText>>.generate(
    typographys.length,
    (index) {
      return Option(
        label: typographys[index].text,
        value: typographys[index],
      );
    },
  );
}

List<Option<FontWeight>> get fontWeightOption {
  final List<OFontWeight> fontWeight = OFontWeight.fontWeightList;
  return List<Option<FontWeight>>.generate(
    fontWeight.length,
    (index) {
      return Option(
        label: fontWeight[index].fontName,
        value: fontWeight[index].fontWeight,
      );
    },
  );
}

List<Option<FontStyle>> get fontStyleOption {
  final List<OFontStyle> fontStyle = OFontStyle.fontStyleList;
  return List<Option<FontStyle>>.generate(
    fontStyle.length,
    (index) {
      return Option(
        label: fontStyle[index].styleName,
        value: fontStyle[index].fontStyle,
      );
    },
  );
}
