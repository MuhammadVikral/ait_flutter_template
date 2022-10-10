import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'constant/constant_category.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        ConstantCategory(context),
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
