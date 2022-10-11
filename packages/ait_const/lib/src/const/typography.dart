import 'package:ait_const/src/const/const.dart';
import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.h1({
    Key? key,
    this.text = 'Text h1',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h1.copyWithArgs(args),
        super(key: key);

  DesignText.h2({
    Key? key,
    this.text = 'Text h2',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h2.copyWithArgs(args),
        super(key: key);

  DesignText.h3({
    Key? key,
    this.text = 'Text h3',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h3.copyWithArgs(args),
        super(key: key);

  DesignText.h4({
    Key? key,
    this.text = 'Text h4',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h4.copyWithArgs(args),
        super(key: key);

  DesignText.h5({
    Key? key,
    this.text = 'Text h5',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h5.copyWithArgs(args),
        super(key: key);

  DesignText.h6({
    Key? key,
    this.text = 'Text h6',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h6.copyWithArgs(args),
        super(key: key);

  DesignText.body1({
    Key? key,
    this.text = 'Text body 1',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body1.copyWithArgs(args),
        super(key: key);

  DesignText.body2({
    Key? key,
    this.text = 'Text body2',
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body2.copyWithArgs(args),
        super(key: key);

  DesignText.caption({
    Key? key,
    this.text = 'Text caption',
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
  final FontWeight fontWeight;
  final Color color;
  DesignTextStyleArgs({
    required this.fontWeight,
    required this.color,
  });
}

extension TextStyleCopyWith on TextStyle {
  copyWithArgs(DesignTextStyleArgs? args) {
    return copyWith(
      fontWeight: args?.fontWeight,
      color: args?.color,
    );
  }
}
