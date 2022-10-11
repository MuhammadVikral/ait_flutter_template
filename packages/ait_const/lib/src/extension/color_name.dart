import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';

extension ColorName on Color {
  static final colorNames = {
    DesignColors.white: 'white',
    DesignColors.black: 'black',
    DesignColors.primaryLight2: 'Primary Light 1',
    DesignColors.primaryLight1: 'Primary Light 2',
    DesignColors.primaryBase: 'Primary base',
    DesignColors.primaryDark1: 'Primary Dark 1',
    DesignColors.primaryDark2: 'Primary Dark 2',
    DesignColors.dangerLight2: 'Danger Light 2',
    DesignColors.dangerLight1: 'Danger Light 1',
    DesignColors.dangerBase: 'Danger Base ',
    DesignColors.dangerDark1: 'Danger Dark 1',
    DesignColors.dangerDark2: 'Danger Dark 2',
    DesignColors.successLight2: 'Success Light 2',
    DesignColors.successLight1: 'Success Light 1',
    DesignColors.successBase: 'Success Base ',
    DesignColors.successDark1: 'Success Dark 1',
    DesignColors.successDark2: 'Success Dark 2',
  };
  String colorName() {
    return colorNames[this] ?? toString();
  }
}
