import 'package:design_system/design_system.dart';
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
    DesignColors.warningLight2: 'Warning Light 2',
    DesignColors.warningLight1: 'Warning Light 1',
    DesignColors.warningBase: 'Warning Base ',
    DesignColors.warningDark1: 'Warning Dark 1',
    DesignColors.warningDark2: 'Warning Dark 2',
    DesignColors.infoLight2: 'Info Light 2',
    DesignColors.infoLight1: 'Info Light 1',
    DesignColors.infoBase: 'Info Base ',
    DesignColors.infoDark1: 'Info Dark 1',
    DesignColors.infoDark2: 'Info Dark 2',
    DesignColors.neutral10: 'Neutral 10',
    DesignColors.neutral20: 'Neutral 20',
    DesignColors.neutral30: 'Neutral 30',
    DesignColors.neutral40: 'Neutral 40',
    DesignColors.neutral50: 'Neutral 50',
    DesignColors.neutral60: 'Neutral 60',
    DesignColors.neutral70: 'Neutral 70',
    DesignColors.neutral80: 'Neutral 80',
    DesignColors.neutral90: 'Neutral 90',
  };
  String get colorName {
    return colorNames[this] ?? toString();
  }
}
