import 'package:common_dependency/common_dependency.dart';
import 'package:di/di.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

void main() async {
  MainDI di = MainDI();
  WidgetsFlutterBinding.ensureInitialized();
  await di();
  await GetIt.I.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = MainNavigation();
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.I<AuthCubit>()..initApp(),
            )
          ],
          child: MaterialApp.router(
            routerConfig: _router,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
