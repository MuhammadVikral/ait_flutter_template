import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'design_system/design_system.dart';

class ConstantCategory extends WidgetbookCategory {
  ConstantCategory(BuildContext context)
      : super(
          name: 'Constant',
          widgets: [
            DesignSystem(context),
          ],
        );
}
