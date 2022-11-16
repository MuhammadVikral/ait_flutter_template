import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class DesignDialogBoxy extends BoxyDelegate {
  @override
  Size layout() {
    var parrentHeight = 0.0;
    var parrentWidth = 303.0;

    // childHeight = min(childHeight, constraints.maxHeight / children.length);

    var y = 24.0;
    for (final child in children) {
      var childSize = child.layout(constraints);
      child.position(
        Offset(
          (parrentWidth - childSize.width) / 2,
          y,
        ),
      );
      y += childSize.height;
      parrentHeight += childSize.height;
    }
    return Size(parrentWidth, parrentHeight + 48);
  }
}
