import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiModule.init();
  await AppLocalizationModule.init();
  await AuthModule.init();
  await GetIt.I.allReady();
  await GetIt.I.getAsync<LocaleSwitchNotifier>();
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
          child: LocaleSwitchApp(
              listenable: GetIt.I<LocaleSwitchNotifier>(),
              builder: (_, locale, __) => MaterialApp.router(
                    routerConfig: _router,
                    scrollBehavior: const MaterialScrollBehavior().copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.stylus,
                        PointerDeviceKind.unknown
                      },
                    ),
                    locale: locale,
                    localizationsDelegates: [
                      SharedStr.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: SharedStr.delegate.supportedLocales,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                  )),
        );
      },
    );
  }
}
