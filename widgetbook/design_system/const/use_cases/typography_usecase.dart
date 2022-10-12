import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../options/knob_options.dart';

class TypograhyUseCase extends WidgetbookUseCase {
  TypograhyUseCase(BuildContext context)
      : super(
          name: 'TypograhyUseCase',
          builder: (context) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(32.0.r),
              color: context.knobBackgroundColorOption,
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
                      color: context.knobColorOption('Text Color'),
                      fontWeight: context.knobFontWeightOption,
                      fontStyle: context.knobFontStyleOption,
                    ),
                  )[index];
                },
              ),
            );
          },
        );
}
