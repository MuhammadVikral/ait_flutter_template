import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

List<Option<Color>> get colorOption => List<Option<Color>>.generate(
      DesignColors.colorList.length,
      (index) {
        return Option(
          label: DesignColors.colorList[index].colorName,
          value: DesignColors.colorList[index],
        );
      },
    );

List<Option<Color>> get backGroundColorOption => List<Option<Color>>.generate(
      DesignColors.colorListBG.length,
      (index) {
        return Option(
          label: DesignColors.colorListBG[index].colorName,
          value: DesignColors.colorListBG[index],
        );
      },
    );
