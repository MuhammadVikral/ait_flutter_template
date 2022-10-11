// ignore_for_file: use_key_in_widget_constructors

import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;
  DesignText.h1({
    this.text = 'Text h1',
    FontWeight? fontWeight = FontWeight.w400,
    Color? color = Colors.black,
    Key? key,
  }) : style = DesignTextStyle.h1Style
            .copyWith(fontWeight: fontWeight, color: color);

  DesignText.body1({
    this.text = 'Text body 1',
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.w400,
    Key? key,
  }) : style = DesignTextStyle.body1.copyWith(
          fontWeight: fontWeight,
          color: color,
        );
  static List<DesignText> listTypography(
          {FontWeight? fontWeight, Color? color}) =>
      [
        DesignText.h1(
          fontWeight: fontWeight,
          color: color,
        ),
        DesignText.body1(
          fontWeight: fontWeight,
          color: color,
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
