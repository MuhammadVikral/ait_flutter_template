import 'package:flutter/cupertino.dart';

abstract class LocaleRepository {
  Future<void> save(Locale locale);
  Locale get();
  Future<Locale> load();
}
