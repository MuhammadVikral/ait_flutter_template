import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'use_cases/typography_usecase.dart';

class ConstStory extends WidgetbookComponent {
  ConstStory(BuildContext context)
      : super(
          name: 'Const Story',
          useCases: [TypograhyUseCase(context)],
        );
}
