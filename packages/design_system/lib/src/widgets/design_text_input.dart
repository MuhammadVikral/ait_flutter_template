import 'package:flutter/material.dart';

import '../../design_system.dart';

class DesignTextInput extends StatelessWidget {
  const DesignTextInput({
    super.key,
    this.errorText,
    this.initialText,
    this.suffixIcon,
    required this.hint,
  });
  final String hint;
  final String? errorText;
  final String? initialText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    String textInput = initialText ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: textInput.isNotEmpty,
          child: DesignText.body1(
            hint,
            args: DesignTextStyleArgs(fontWeight: boldFont),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
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
            hintText: hint,
            hintStyle: DesignTextStyle.body1.copyWith(
              color: DesignColors.disabledText,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
