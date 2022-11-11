import 'package:flutter/material.dart';

import '../../design_system.dart';

class DesignTextInput extends StatelessWidget {
  const DesignTextInput({
    super.key,
    this.errorText,
    this.initialText,
    this.suffixIcon,
    required this.hint,
    this.disabled = false,
    this.alwaysShowLabel = false,
    this.showHint = true,
    this.onChanged,
    this.suffixLabel,
    this.ontap,
    this.focusNode,
  });
  final String hint;
  final String? errorText;
  final String? initialText;
  final Widget? suffixIcon;
  final Widget? suffixLabel;
  final FocusNode? focusNode;
  final bool disabled;
  final bool showHint;
  final bool alwaysShowLabel;
  final Function(String?)? onChanged;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    String textInput = initialText ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: alwaysShowLabel ? true : textInput.isNotEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DesignText.body2(
                hint,
              ).medium,
              suffixLabel ?? const SizedBox()
            ],
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          key: Key(textInput),
          focusNode: focusNode,
          initialValue: textInput,
          style: DesignTextStyle.body1.copyWithArgs(
            DesignTextStyleArgs(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: ontap,
          enabled: !disabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: disabled ? DesignColors.neutral20 : DesignColors.white,
            errorText: errorText,
            errorStyle: DesignTextStyle.caption,
            enabledBorder: _metaBorder(DesignColors.neutral40),
            disabledBorder: _metaBorder(DesignColors.neutral40),
            focusedBorder: _metaBorder(DesignColors.primaryBase),
            errorBorder: _metaBorder(DesignColors.dangerBase),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            hintText: showHint ? hint : null,
            hintStyle: DesignTextStyle.body1.copyWithArgs(
              DesignTextStyleArgs(
                color: DesignColors.neutral60,
                fontWeight: mediumFont,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _metaBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    );
  }
}
