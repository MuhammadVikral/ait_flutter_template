import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../options/color_option.dart';

class TypograhyUseCase extends WidgetbookUseCase {
  TypograhyUseCase(BuildContext context)
      : super(
          name: 'TypograhyUseCase',
          builder: (context) {
            return Container(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: DesignText.listTypography(
                  args: DesignTextStyleArgs(
                    fontWeight: context.knobs.options(
                      label: 'Font Weight',
                      options: fontWeightOption,
                    ),
                    color: context.knobs.options(
                      label: 'Text Color',
                      options: colorOption,
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
