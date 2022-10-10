import 'package:flutter/cupertino.dart';

class DesignTextStyle extends TextStyle {
  const DesignTextStyle._();
  static const String satoshi = 'Satoshi';
  static const TextStyle h1Style = TextStyle(
    fontFamily: satoshi,
    fontSize: 60,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle body1 = TextStyle(
    fontFamily: satoshi,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
