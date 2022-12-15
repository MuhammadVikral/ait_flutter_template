import 'package:app_localization/src/domain/repositories/locale_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:locale_switch/locale_switch.dart';

class ChangeLocaleUseCase {
  final LocaleRepository repository;
  final LocaleSwitchNotifier notifier;

  ChangeLocaleUseCase(this.repository, this.notifier);

  void call() {
    final current = repository.get();
    notifier.value = current.languageCode == 'en'
        ? const Locale('id', 'ID')
        : const Locale('en', 'US');
    repository.save(notifier.value);
  }
}
