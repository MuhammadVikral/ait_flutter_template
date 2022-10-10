import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'use_cases/color_palet.dart';

class DesignSystem extends WidgetbookComponent {
  DesignSystem(BuildContext context)
      : super(
          name: 'design System',
          useCases: [
            ColorPalet(context),
          ],
        );
}
