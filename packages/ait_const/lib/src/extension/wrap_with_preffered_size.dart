import 'package:flutter/material.dart';

extension WrapWithPrefferedSize on Widget {
  PreferredSize setAsPrefferedSizeWidget(Size size) {
    return PreferredSize(
      preferredSize: size,
      child: this,
    );
  }
}
