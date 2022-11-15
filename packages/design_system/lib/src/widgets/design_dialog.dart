import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class DesignDialog extends StatelessWidget {
  const DesignDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text('test'),
    );
  }
}
