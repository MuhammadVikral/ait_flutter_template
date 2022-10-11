import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';

extension ColorName on Color {
  static final colorNames = {
    DesignColors.black: 'black',
    DesignColors.primaryLight2: 'primary Light 1',
    DesignColors.primaryLight1: 'primary Light 2',
    DesignColors.primaryBase: 'primary base',
    DesignColors.primaryDark1: 'primary Dark 1',
    DesignColors.primaryDark2: 'primary Dark 2',
  };
  String colorName() {
    return colorNames[this] ?? toString();
  }
}
