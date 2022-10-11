import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignTextStyleArgs {
  final FontWeight fontWeight;
  final Color color;
  DesignTextStyleArgs({
    required this.fontWeight,
    required this.color,
  });
}

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.h1({
    Key? key,
    this.text = 'Text h1',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h1Style.copyWithArgs(args),
        super(key: key);

  DesignText.body1({
    Key? key,
    this.text = 'Text body 1',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body1.copyWithArgs(args),
        super(key: key);

  static List<DesignText> listTypography({DesignTextStyleArgs? args}) => [
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
  copyWithArgs(DesignTextStyleArgs? args) {
    return copyWith(fontWeight: args?.fontWeight, color: args?.color);
  }
}
