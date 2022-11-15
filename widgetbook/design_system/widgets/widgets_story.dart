import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'use_case/design_button_story.dart';
import 'use_case/design_dialog_story.dart';
import 'use_case/design_text_input_story.dart';

class WidgetsStory extends WidgetbookComponent {
  WidgetsStory(BuildContext context)
      : super(
          name: 'Widget Story',
          useCases: [
            DesignButtonStory(context),
            WidgetbookUseCase(
              name: 'Text Input',
              builder: (context) {
                return const DesignTextInputStory();
              },
            ),
            WidgetbookUseCase.center(
              name: 'Dialog',
              child: DesignDialogStory(),
            ),
          ],
        );
}
