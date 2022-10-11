import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

List<Option<Color>> get colorOption => List<Option<Color>>.generate(
      DesignColors.colorList.length,
      (index) {
        return Option(
          label: DesignColors.colorList[index].colorName(),
          value: DesignColors.colorList[index],
        );
      },
    );

List<Option<Widget>> typographyOption(
    {FontWeight? fontWeight, DesignColors? color}) {
  final List<DesignText> typographys = DesignText.listTypography();
  return List<Option<Widget>>.generate(
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
  final List<DFontWeight> fontWeight = DFontWeight.fontWeightList;
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
