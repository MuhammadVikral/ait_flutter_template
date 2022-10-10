import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

List<Color> get primaryList => [
      DesignColors.primaryLight2,
      DesignColors.primaryLight1,
      DesignColors.primaryBase,
      DesignColors.primaryDark1,
      DesignColors.primaryDark2,
    ];

List<Option<Color>> get colorOption => List<Option<Color>>.generate(
      primaryList.length,
      (index) => Option(
        label: primaryList[index].toString(),
        value: primaryList[index],
      ),
    );
