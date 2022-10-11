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

List<Option<Widget>> get typographyOption => List<Option<Widget>>.generate(
      DesignText.listTypography.length,
      (index) {
        return Option(
          label: DesignText.listTypography[index].text,
          value: DesignText.listTypography[index],
        );
      },
    );
