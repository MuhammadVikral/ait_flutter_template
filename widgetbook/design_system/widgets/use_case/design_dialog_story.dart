import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class DesignDialogStory extends StatelessWidget {
  const DesignDialogStory({super.key});

  @override
  Widget build(BuildContext context) {
    bool negativeButton = context.knobs
        .boolean(label: 'with negative button', initialValue: false);
    bool possitiveButton = context.knobs
        .boolean(label: 'with positive button', initialValue: false);
    bool withImage =
        context.knobs.boolean(label: 'with image', initialValue: false);
    String title = context.knobs.text(label: 'title', initialValue: 'Title');
    String body = context.knobs.text(label: 'body', initialValue: 'Body');

    return DesignDialog(
      onNegative: negativeButton == true ? () {} : null,
      onPositive: possitiveButton == true ? () {} : null,
      image: withImage
          ? DesignImage(
              AImage.exclamation,
              height: 56,
              width: 56,
            )
          : null,
      title: title,
      body: body,
    );
  }
}
