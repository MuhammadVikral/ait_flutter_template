import 'dart:ui';

import 'package:app_localization/src/data/repositories/locale_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FlutterSecureStorage>()])
import 'locale_repository_impl_test.mocks.dart';

void main() {
  late LocaleRepositoryImpl repository;
  late MockFlutterSecureStorage storage;

  group('load', () {
    setUp(() {
      storage = MockFlutterSecureStorage();
      repository = LocaleRepositoryImpl(storage);
    });
    test('Load should load default value when no result from storage',
        () async {
      when(storage.read(key: anyNamed("key")))
          .thenAnswer((realInvocation) => Future.value(null));
      expect((await repository.load()).toLanguageTag(), 'en-US');
      verify(storage.read(key: anyNamed("key"))).called(1);
    });

    test('Load should load storage value', () async {
      when(storage.read(key: anyNamed("key")))
          .thenAnswer((realInvocation) => Future.value('fr-FR'));
      expect((await repository.load()).toLanguageTag(), 'fr-FR');
    });
  });

  group('get', () {
    setUp(() {
      storage = MockFlutterSecureStorage();
      repository = LocaleRepositoryImpl(storage);
    });
    test('get should throw error when not loaded first', () async {
      expect(
          () => repository.get(),
          throwsA(predicate((e) =>
              e.toString() == 'Null check operator used on a null value')));
    });

    test('Get should fetch same result as load', () async {
      when(storage.read(key: anyNamed("key")))
          .thenAnswer((realInvocation) => Future.value('fr-FR'));
      expect((await repository.load()), repository.get());
    });
  });

  group('save', () {
    setUpAll(() {
      storage = MockFlutterSecureStorage();
      repository = LocaleRepositoryImpl(storage);
      repository.save(const Locale('fr', 'FR'));
    });
    test('save should call storage.write with correct parameter', () async {
      verify(storage.write(key: anyNamed("key"), value: 'fr-FR')).called(1);
    });
  });
}
