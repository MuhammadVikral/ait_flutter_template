import 'dart:ui';

import 'package:app_localization/app_localization.dart';
import 'package:app_localization/src/domain/repositories/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locale_switch/locale_switch.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LocaleRepository>()])
import 'change_locale_usecase_test.mocks.dart';

void main() {
  late ChangeLocaleUseCase useCase;
  late MockLocaleRepository localeRepository;
  late LocaleSwitchNotifier localeSwitchNotifier;

  setUpAll(() {
    localeRepository = MockLocaleRepository();
    localeSwitchNotifier = LocaleSwitchNotifier(const Locale('en', 'US'));
    useCase = ChangeLocaleUseCase(localeRepository, localeSwitchNotifier);
    when(localeRepository.get())
        .thenAnswer((realInvocation) => const Locale('en', 'US'));
    useCase();
  });

  group('repository', () {
    test('repository.get should be called once', () {
      verify(localeRepository.get()).called(1);
    });

    test('repository.save should be called once with correct parameter', () {
      final verified = verify(localeRepository.save(captureAny));
      verified.called(1);
      expect(verified.captured.first.toString(),
          const Locale('id', 'ID').toString());
    });
  });

  test('notifier value should have correct value', () {
    expect(localeSwitchNotifier.value.toString(),
        const Locale('id', 'ID').toString());
  });
}
