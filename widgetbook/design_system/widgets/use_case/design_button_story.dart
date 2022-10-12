import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class DesignButtonStory extends WidgetbookUseCase {
  DesignButtonStory(BuildContext context)
      : super(
          name: 'Design Button',
          builder: (context) {
            return DesignButton.filled(
              args: DesignButtonArgs(
                child: DesignText.body2(),
              ),
            );
          },
        );
}
