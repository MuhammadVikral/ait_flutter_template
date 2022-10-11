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
    Key? key,
  }) : style = DesignTextStyle.h1Style
            .copyWith(fontWeight: args?.fontWeight, color: args?.color);

  DesignText.body1({
    this.text = 'Text body 1',
    DesignTextArgs? args,
    Key? key,
  }) : style = DesignTextStyle.body1.copyWith(
          fontWeight: args?.fontWeight,
          color: args?.color,
        );
  static List<DesignText> listTypography({DesignTextArgs? args}) => [
        DesignText.h1(
          args: args,
        ),
        DesignText.body1(
          args: args,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
