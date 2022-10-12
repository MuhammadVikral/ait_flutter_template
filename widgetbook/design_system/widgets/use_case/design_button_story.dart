import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';
import '../../../options/knob_options.dart';

class DesignButtonStory extends WidgetbookUseCase {
  DesignButtonStory(BuildContext context)
      : super(
          name: 'Design Button',
          builder: (context) {
            bool buttonEnabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );
            bool withLeading = context.knobs.boolean(
              label: 'With Leading',
              initialValue: false,
            );
            bool withTraling = context.knobs.boolean(
              label: 'With Trailing',
              initialValue: false,
            );

            return Center(
              child: DesignButton(
                backgroundColor: context.knobBackgroundColorOption,
                enabled: buttonEnabled,
                height: context.knobs
                    .number(
                      label: 'Button Height',
                      initialValue: 32,
                    )
                    .toDouble(),
                width: context.knobs
                    .number(
                      label: 'Button Width',
                      initialValue: 97,
                    )
                    .toDouble(),
                leading: withLeading
                    ? Icon(
                        Icons.bookmark,
                        size: 12.0,
                        color: buttonEnabled
                            ? DesignColors.white
                            : DesignColors.disabledText,
                      )
                    : null,
                trailing: withTraling
                    ? Icon(
                        Icons.bookmark,
                        size: 12.0,
                        color: buttonEnabled
                            ? DesignColors.white
                            : DesignColors.disabledText,
                      )
                    : null,
                child: DesignText.body2(
                  context.knobs.text(
                    label: 'Text',
                    initialValue: 'Button',
                    description: 'Use this to change the text inside button',
                  ),
                  args: DesignTextStyleArgs(
                    color: context.knobTextColorOption,
                    fontWeight: context.knobFontWeightOption,
                  ),
                ),
              ),
            );
          },
        );
}
