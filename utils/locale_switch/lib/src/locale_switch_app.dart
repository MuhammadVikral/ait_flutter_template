import 'package:flutter/widgets.dart';

import 'locale_switch_notifier.dart';

typedef LocaleSwitchBuilder = Widget Function(
  BuildContext context,
  Locale? locale,
  Widget? child,
);

class LocaleSwitchApp extends AnimatedWidget {
  const LocaleSwitchApp({
    required LocaleSwitchNotifier super.listenable,
    required this.builder,
    this.child,
    super.key,
  });

  final LocaleSwitchBuilder builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return builder(
        context, (super.listenable as LocaleSwitchNotifier).value, child);
  }
}
