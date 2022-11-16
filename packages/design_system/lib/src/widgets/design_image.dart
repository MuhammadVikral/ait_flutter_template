import 'package:flutter/material.dart';
import 'package:common_dependency/common_dependency.dart';

class DesignImage extends StatelessWidget {
  const DesignImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset('assets/images/');
  }
}
