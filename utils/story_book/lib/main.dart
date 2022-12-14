import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgetbook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().injectApp();
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
