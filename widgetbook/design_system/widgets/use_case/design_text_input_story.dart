import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class DesignTextInputStory extends StatelessWidget {
  const DesignTextInputStory({super.key});

  @override
  Widget build(BuildContext context) {
    String initialText = context.knobs.text(
      label: 'Input Text',
      initialValue: '',
    );
    String hintText = context.knobs.text(
      label: 'Hint Text',
      initialValue: 'Input Text via Knobs',
    );
    String errorMessage = context.knobs.text(
      label: 'Error Message',
      initialValue: 'Tidak boleh kosong',
    );
    bool disabled = context.knobs.boolean(label: 'disabled');
    bool showErrorMessage = context.knobs.boolean(label: 'Show Error Message');
    Widget? suffixIcon = context.knobs.options(
      label: 'suffix Icon',
      options: suffixOptions,
    );
    return Container(
      padding: const EdgeInsets.all(32.0),
      alignment: Alignment.center,
      child: DesignTextInput(
        hint: hintText,
        initialText: initialText,
        errorText: !showErrorMessage
            ? null
            : initialText.isEmpty
                ? errorMessage
                : null,
        disabled: disabled,
        suffixIcon: suffixIcon,
        onChanged: (value) {},
      ),
    );
  }
}

List<Option<Widget?>> get suffixOptions {
  return [
    const Option(label: 'No Suffix', value: null),
    Option(
      label: 'Delete All World',
      value: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.close),
        color: DesignColors.neutral60,
      ),
    ),
  ];
}
