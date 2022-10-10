import 'package:ait_flutter_template/feature/glosarium/presentation/glosarium_page.dart';
import 'package:ait_flutter_template/feature/glosarium/presentation/pages/color_glosarium/color_glosarium.dart';
import 'package:flutter/material.dart';
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
                  name: 'Icon',
                  builder: (context) {
                    return const GlosariumPage();
                  },
                ),
                WidgetbookUseCase(
                  name: 'placeholder',
                  builder: (context) {
                    return ColorPlaceHolder(
                      color: context.knobs.options(
                        label: 'color',
                        options: colorOption,
                      ),
                      colorName: 'test',
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
