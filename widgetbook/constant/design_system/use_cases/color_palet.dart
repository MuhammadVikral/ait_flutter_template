import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../options/color_option.dart';

class ColorPalet extends WidgetbookUseCase {
  ColorPalet(BuildContext context)
      : super(
          name: 'color palet',
          builder: (context) {
            return Card(
              elevation: 10,
              child: Container(
                margin: EdgeInsets.all(20.r),
                color: context.knobs.options(
                  label: 'color',
                  options: colorOption,
                ),
              ),
            );
          },
        );
}
