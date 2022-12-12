import 'package:api/api.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
