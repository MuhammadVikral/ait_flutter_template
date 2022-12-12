import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'const/const_story.dart';
import 'widgets/widgets_story.dart';

class DesignSystemCategory extends WidgetbookCategory {
  DesignSystemCategory(BuildContext context)
      : super(
          name: 'Design System',
          widgets: [
            ConstStory(context),
            WidgetsStory(context),
          ],
        );
}
