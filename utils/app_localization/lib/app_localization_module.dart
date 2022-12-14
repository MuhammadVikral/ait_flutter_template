import 'package:app_localization/src/data/repositories/locale_repository_impl.dart';
import 'package:app_localization/src/domain/repositories/locale_repository.dart';
import 'package:app_localization/src/domain/use_case/change_locale_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:locale_switch/locale_switch.dart';

final sl = GetIt.instance;

class AppLocalizationModule {
  static Future<void> init() async {
    sl.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(sl()));
    sl.registerLazySingleton(() => ChangeLocaleUseCase(sl(), sl()));
    sl.registerLazySingletonAsync(
        () async => LocaleSwitchNotifier(await sl<LocaleRepository>().load()));
  }
}
