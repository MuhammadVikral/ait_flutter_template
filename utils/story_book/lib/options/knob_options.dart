import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'color_option.dart';
import 'typography_options.dart';
import 'button_type_option.dart';

extension KnobOptions on BuildContext {
  DesignButtonType get knobButtonTypeOption {
    return knobs.options(label: 'Button Type', options: buttonTypeOption);
  }

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
