import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../options/color_option.dart';
import '../../../options/typography_options.dart';

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
                    color: context.knobs.options(
                      label: 'Text Color',
                      options: colorOption,
                    ),
                    fontWeight: context.knobs.options(
                      label: 'Font Weight',
                      options: fontWeightOption,
                    ),
                    fontStyle: context.knobs.options(
                      label: 'Font Style',
                      options: fontStyleOption,
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
