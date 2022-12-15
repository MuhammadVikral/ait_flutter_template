import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locale_switch/locale_switch.dart';

Widget builder(
  BuildContext context,
  Locale? locale,
  Widget? child,
) {
  return locale?.languageCode == 'en' && child != null ? child : Container();
}

void main() {
  final finder = find.byKey(const ValueKey("is_en"));
  testWidgets(
    'should display correct widget depends on locale value',
    (tester) async {
      final listenable = LocaleSwitchNotifier(const Locale('en', 'EN'));
      await tester.pumpWidget(LocaleSwitchApp(
        listenable: listenable,
        builder: builder,
        child: Container(key: const Key("is_en")),
      ));
      expect(finder, findsOneWidget);
      listenable.value = const Locale("id", "ID");
      await tester.pumpAndSettle();
      expect(finder, findsNothing);
      listenable.value = const Locale("en", "EN");
      await tester.pumpAndSettle();
      expect(finder, findsOneWidget);
    },
  );
}
