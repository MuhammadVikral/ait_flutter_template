import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../options/knob_options.dart';

class DesignButtonStory extends WidgetbookUseCase {
  DesignButtonStory(BuildContext context)
      : super(
          name: 'Design Button',
          builder: (context) {
            DesignButtonType buttonType = context.knobButtonTypeOption;
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
            bool isLoading =
                context.knobs.boolean(label: 'is Loading', initialValue: false);
            Color color = context.knobTextColorOption;

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
                        color: buttonEnabled ? color : DesignColors.neutral60,
                      )
                    : null,
                trailing: withTraling
                    ? Icon(
                        Icons.bookmark,
                        size: 12.0,
                        color: buttonEnabled ? color : DesignColors.neutral60,
                      )
                    : null,
                buttonType: buttonType,
                isLoading: isLoading,
                onTap: () {},
                child: DesignText.body2(
                  context.knobs.text(
                    label: 'Text',
                    initialValue: 'Button',
                    description: 'Use this to change the text inside button',
                  ),
                  args: DesignTextStyleArgs(
                    color: color,
                    fontWeight: context.knobFontWeightOption,
                  ),
                ),
              ),
            );
          },
        );
}
