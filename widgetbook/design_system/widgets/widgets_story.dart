import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'use_case/design_button_story.dart';

class WidgetsStory extends WidgetbookComponent {
  WidgetsStory(BuildContext context)
      : super(
          name: 'Widget Story',
          useCases: [
            DesignButtonStory(context),
          ],
        );
}
