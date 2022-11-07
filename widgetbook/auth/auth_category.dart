import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

import 'login/login_story.dart';

class AuthCategory extends WidgetbookCategory {
  AuthCategory(BuildContext context)
      : super(
          name: 'Auth Category',
          widgets: [
            LoginStory(context),
          ],
        );
}
