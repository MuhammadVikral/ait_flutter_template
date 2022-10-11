// ignore_for_file: use_key_in_widget_constructors

import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignTextArgs {
  final FontWeight fontWeight;
  final Color color;
  DesignTextArgs({
    required this.fontWeight,
    required this.color,
  });
}

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.h1({
    this.text = 'Text h1',
    DesignTextArgs? args,
  }) : style = DesignTextStyle.h1Style.copyWithArgs(args);

  DesignText.body1({
    this.text = 'Text body 1',
    DesignTextArgs? args,
  }) : style = DesignTextStyle.body1.copyWithArgs(args);

  static List<DesignText> listTypography({DesignTextArgs? args}) => [
        DesignText.h1(args: args),
        DesignText.body1(args: args),
      ];

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

extension TextStyleCopyWith on TextStyle {
  copyWithArgs(DesignTextArgs? args) {
    copyWith(fontWeight: args?.fontWeight, color: args?.color);
  }
}
