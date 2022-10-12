import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class DesignButtonStory extends WidgetbookUseCase {
  DesignButtonStory(BuildContext context)
      : super(
          name: 'Design Button',
          builder: (context) {
            return DesignButton(
              child: DesignText.body2(
                'Button',
                args: DesignTextStyleArgs(
                  color: DesignColors.white,
                ),
              ),
            );
          },
        );
}
