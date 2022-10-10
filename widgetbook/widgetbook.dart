import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';

import 'options/color_option.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'material',
          widgets: [
            WidgetbookComponent(
              name: 'FAB',
              useCases: [
                WidgetbookUseCase(
                  name: 'placeholder',
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
                )
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'ait fltter template'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
    );
  }
}
