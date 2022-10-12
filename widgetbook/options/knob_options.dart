import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './color_option.dart';
import './typography_options.dart';

extension KnobOptions on BuildContext {
  Color knobColorOption(String label) {
    return knobs.options(label: label, options: colorOption);
  }

  Color get knobBackgroundColorOption {
    return knobs.options(
        label: 'Background Color', options: backGroundColorOption);
  }

  FontWeight get knobFontWeightOption {
    return knobs.options(label: 'Font Weight', options: fontWeightOption);
  }

  FontStyle get knobFontStyleOption {
    return knobs.options(label: 'Font Style', options: fontStyleOption);
  }
}
