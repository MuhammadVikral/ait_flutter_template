import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.h1({
    Key? key,
    this.text = 'H1/60px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h1.copyWithArgs(args),
        super(key: key);

  DesignText.h2({
    Key? key,
    this.text = 'H2/48px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h2.copyWithArgs(args),
        super(key: key);

  DesignText.h3({
    Key? key,
    this.text = 'H3/34px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h3.copyWithArgs(args),
        super(key: key);

  DesignText.h4({
    Key? key,
    this.text = 'H4/28px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h4.copyWithArgs(args),
        super(key: key);

  DesignText.h5({
    Key? key,
    this.text = 'H5/24px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h5.copyWithArgs(args),
        super(key: key);

  DesignText.h6({
    Key? key,
    this.text = 'H6/20px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h6.copyWithArgs(args),
        super(key: key);

  DesignText.body1({
    Key? key,
    this.text = 'Body 1/16px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body1.copyWithArgs(args),
        super(key: key);

  DesignText.body2({
    Key? key,
    this.text = 'Body 2/14px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body2.copyWithArgs(args),
        super(key: key);

  DesignText.caption({
    Key? key,
    this.text = 'Caption/12px',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.caption.copyWithArgs(args),
        super(key: key);

  static List<DesignText> listTypography({DesignTextStyleArgs? args}) => [
        DesignText.h1(args: args),
        DesignText.h2(args: args),
        DesignText.h3(args: args),
        DesignText.h4(args: args),
        DesignText.h5(args: args),
        DesignText.h6(args: args),
        DesignText.body1(args: args),
        DesignText.body2(args: args),
        DesignText.caption(args: args),
      ];

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class DesignTextStyleArgs {
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  DesignTextStyleArgs({
    this.color,
    this.fontWeight,
    this.fontStyle,
  });
}

extension TextStyleCopyWith on TextStyle {
  copyWithArgs(DesignTextStyleArgs? args) {
    return copyWith(
      color: args?.color,
      fontWeight: args?.fontWeight,
      fontStyle: args?.fontStyle,
    );
  }
}
