import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const DesignText(this.text, {Key? key, required this.style})
      : super(key: key);

  DesignText.h1(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h1.copyWithArgs(args),
        super(key: key);

  DesignText.h2(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h2.copyWithArgs(args),
        super(key: key);

  DesignText.h3(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h3.copyWithArgs(args),
        super(key: key);

  DesignText.h4(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h4.copyWithArgs(args),
        super(key: key);

  DesignText.h5(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h5.copyWithArgs(args),
        super(key: key);

  DesignText.h6(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.h6.copyWithArgs(args),
        super(key: key);

  DesignText.body1(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body1.copyWithArgs(args),
        super(key: key);

  DesignText.body2(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.body2.copyWithArgs(args),
        super(key: key);

  DesignText.caption(
    this.text, {
    Key? key,
    DesignTextStyleArgs? args,
  })  : style = DesignTextStyle.caption.copyWithArgs(args),
        super(key: key);

  static List<DesignText> listTypography({DesignTextStyleArgs? args}) => [
        DesignText.h1('H2/60px', args: args),
        DesignText.h2('H2/60px', args: args),
        DesignText.h3('H2/60px', args: args),
        DesignText.h4('H2/60px', args: args),
        DesignText.h5('H2/60px', args: args),
        DesignText.h6('H2/60px', args: args),
        DesignText.body1('H2/60px', args: args),
        DesignText.body2('H2/60px', args: args),
        DesignText.caption('H2/60px', args: args),
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

extension OverideDesignTextColor on DesignText {
  DesignText overideColor(Color overideColor) {
    return DesignText(
      text,
      style: style.copyWithArgs(
        DesignTextStyleArgs(
          color: overideColor,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
        ),
      ),
    );
  }
}
