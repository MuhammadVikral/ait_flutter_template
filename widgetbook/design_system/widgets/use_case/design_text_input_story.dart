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
    String errorMessage = context.knobs.text(
      label: 'Error Message',
      initialValue: 'Tidak boleh kosong',
    );
    Function() deleteText = () {
      initialText = '';
    };
    Widget? suffixIcon = context.knobs.options(
      label: 'suffix Icon',
      options: suffixOptions,
    );
    return Container(
      padding: const EdgeInsets.all(32.0),
      alignment: Alignment.center,
      child: DesignTextInput(
        hint: 'input text from knobs',
        initialText: initialText,
        errorText: initialText.isEmpty ? errorMessage : null,
        suffixIcon: suffixIcon,
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
