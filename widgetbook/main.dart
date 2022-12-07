import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

import 'widgetbook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiModule.init();
  await AuthModule.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context, child) {
        return const WidgetbookHotReload();
      },
    ),
  );
}
