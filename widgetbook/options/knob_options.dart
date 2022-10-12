import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import './color_option.dart';
import './typography_options.dart';

extension KnobOptions on BuildContext {
  Color get knobBackgroundColorOption {
    return knobs.options(
        label: 'Background Color', options: backGroundColorOption);
  }

  Color get knobTextColorOption {
    return knobs.options(
      label: 'Text Color',
      options: textColorOption,
    );
  }

  FontWeight get knobFontWeightOption {
    return knobs.options(label: 'Font Weight', options: fontWeightOption);
  }

  FontStyle get knobFontStyleOption {
    return knobs.options(label: 'Font Style', options: fontStyleOption);
  }
}
