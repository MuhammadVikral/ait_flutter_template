import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';
import '../../../options/knob_options.dart';

class DesignButtonStory extends WidgetbookUseCase {
  DesignButtonStory(BuildContext context)
      : super(
          name: 'Design Button',
          builder: (context) {
            return Center(
              child: DesignButton(
                backgroundColor: context.knobBackgroundColorOption,
                height: context.knobs
                    .number(
                      label: 'Button Height',
                      initialValue: 32,
                    )
                    .toDouble(),
                width: context.knobs
                    .number(
                      label: 'Button Width',
                      initialValue: 200,
                    )
                    .toDouble(),
                child: DesignText.body2(
                  context.knobs.text(label: 'Text', initialValue: 'Button'),
                  args: DesignTextStyleArgs(
                    color: context.knobTextColorOption,
                  ),
                ),
              ),
            );
          },
        );
}
