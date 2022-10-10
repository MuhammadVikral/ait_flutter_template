import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class TypograhyUseCase extends WidgetbookUseCase {
  TypograhyUseCase(BuildContext context)
      : super(
          name: 'TypograhyUseCase',
          builder: (context) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  DesignText.h1(),
                  DesignText.body1(),
                ],
              ),
            );
          },
        );
  Widget _buildTextList() {
    return ListView();
  }
}
