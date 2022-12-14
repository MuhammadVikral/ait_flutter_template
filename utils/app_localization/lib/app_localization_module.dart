import 'package:app_localization/src/data/repositories/locale_repository_impl.dart';
import 'package:app_localization/src/domain/repositories/locale_repository.dart';
import 'package:app_localization/src/domain/use_case/change_locale_usecase.dart';
import 'package:design_system/design_system.dart';
import 'package:locale_switch/locale_switch.dart';

class AppLocalizationModule {
  Future<void> call() async {
    di.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(di()));
    di.registerLazySingleton(() => ChangeLocaleUseCase(di(), di()));
    di.registerLazySingletonAsync(
        () async => LocaleSwitchNotifier(await di<LocaleRepository>().load()));
    await di.getAsync<LocaleSwitchNotifier>();
  }
}
