import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.all(32.0.r),
              color: context.knobs.options(
                label: 'Background Color',
                options: backGroundColorOption,
              ),
              child: ListView.separated(
                itemCount: DesignText.listTypography().length,
                physics: const ScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 24.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return DesignText.listTypography(
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
                  )[index];
                },
              ),
            );
          },
        );
}
