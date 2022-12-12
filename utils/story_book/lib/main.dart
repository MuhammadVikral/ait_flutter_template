import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgetbook.dart';

void main() async {
  MainDI di = MainDI();
  WidgetsFlutterBinding.ensureInitialized();
  await di();
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
