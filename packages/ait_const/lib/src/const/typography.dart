// ignore_for_file: use_key_in_widget_constructors

import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;
  DesignText.h1(
      {required this.text, FontWeight? fontWeight = FontWeight.w400, Key? key})
      : style = DesignTextStyle.h1Style.copyWith(fontWeight: fontWeight);

  DesignText.body1(
      {required this.text, FontWeight? fontWeight = FontWeight.w400, Key? key})
      : style = DesignTextStyle.body1.copyWith(fontWeight: fontWeight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
