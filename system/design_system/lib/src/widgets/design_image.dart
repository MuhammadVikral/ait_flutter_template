import 'package:flutter/material.dart';
import 'package:common_dependency/common_dependency.dart';

class DesignImage extends StatelessWidget {
  const DesignImage(this.image, {super.key, this.height, this.width});
  final String image;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      AImage.exclamation,
      height: height ?? 56,
      width: width ?? 56,
    );
  }
}
