import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'auth/auth_category.dart';
import 'design_system/design_system_category.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        DesignSystemCategory(context),
        AuthCategory(context),
      ],
      useCaseBuilder: (context, child) {
        return BlocProvider(
          create: (context) => LoginCubit(),
          child: Center(child: child),
        );
      },
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
