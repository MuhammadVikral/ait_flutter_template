import 'package:flutter/material.dart';

import '../../design_system.dart';

class DesignTextInput extends StatelessWidget {
  const DesignTextInput({
    super.key,
    this.errorText,
    this.initialText,
    this.suffixIcon,
  });
  final String? errorText;
  final String? initialText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    String textInput = initialText ?? '';
    return TextFormField(
      key: Key(textInput),
      initialValue: textInput,
      style: DesignTextStyle.body1,
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: DesignTextStyle.caption,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
