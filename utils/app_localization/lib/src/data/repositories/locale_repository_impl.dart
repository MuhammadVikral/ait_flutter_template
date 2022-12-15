import 'dart:ui';

import 'package:app_localization/src/domain/repositories/locale_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final FlutterSecureStorage storage;
  final String key;
  final String initial;
  Locale? current;

  LocaleRepositoryImpl(this.storage,
      {this.initial = 'en-US', this.key = 'app_language'});

  @override
  Future<Locale> load() async {
    final localeStr = await storage.read(key: key) ?? initial;
    final split = localeStr.split('-');
    current = Locale(split[0], split[1]);
    return current!;
  }

  @override
  Locale get() {
    return current!;
  }

  @override
  Future<void> save(Locale locale) async {
    current = locale;
    await storage.write(key: key, value: locale.toLanguageTag());
  }
}
