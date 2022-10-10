import 'package:ait_const/ait_const.dart';
import 'package:ait_flutter_template/feature/glosarium/presentation/glosarium_page.dart';
import 'package:ait_flutter_template/feature/glosarium/presentation/pages/color_glosarium/color_glosarium.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

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
                    return GlosariumPage();
                  },
                ),
                WidgetbookUseCase(
                  name: 'placeholder',
                  builder: (context) {
                    return ColorPlaceHolder(
                      color: context.knobs.options(label: 'color', options: [
                        Option(
                          label: 'primary Light 2',
                          value: BoxColors.primaryLight2,
                        ),
                        Option(
                          label: 'primary Light 1',
                          value: BoxColors.primaryLight1,
                        ),
                      ]),
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
