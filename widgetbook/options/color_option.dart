import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

List<Option<Color>> get backGroundColorOption {
  return List<Option<Color>>.generate(
    DesignColors.colorList.length,
    (index) {
      return Option(
        label: DesignColors.colorList[index].colorName,
        value: DesignColors.colorList[index],
      );
    },
  );
}

List<Option<Color>> get textColorOption {
  List<Color> items = [DesignColors.black, DesignColors.white];
  for (var element in DesignColors.colorList) {
    if (element != DesignColors.black && element != DesignColors.white) {
      items.add(element);
    }
  }
  return List<Option<Color>>.generate(
    items.length,
    (index) {
      return Option(
        label: items[index].colorName,
        value: items[index],
      );
    },
  );
}
