import 'package:design_system/src/const/asset_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

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
