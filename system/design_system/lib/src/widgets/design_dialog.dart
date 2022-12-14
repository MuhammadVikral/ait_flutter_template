import 'package:boxy/boxy.dart';
import 'package:design_system/src/const/colors/colors.dart';
import 'package:design_system/src/const/typography/design_typography.dart';
import 'package:design_system/src/widgets/design_button.dart';
import 'package:design_system/src/widgets/design_dialog_boxy.dart';
import 'package:design_system/src/widgets/design_image.dart';
import 'package:flutter/material.dart';

class DesignDialog extends StatelessWidget {
  const DesignDialog({
    super.key,
    this.onPositive,
    this.onNegative,
    this.title = '',
    this.body = '',
    this.image,
    this.negativeButtonTitle = 'batal',
    this.positiveButtonTitle = 'oke',
  });
  final String title;
  final String body;
  final String negativeButtonTitle;
  final String positiveButtonTitle;
  final DesignImage? image;
  final Function()? onPositive;
  final Function()? onNegative;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomBoxy(
        delegate: DesignDialogBoxy(),
        children: [
          _DialogImage(image: image),
          _buildTitle(),
          _buildBody(),
          _DialogButtons(
            onNegative: onNegative,
            onPositive: onPositive,
            onNegativetitle: negativeButtonTitle,
            onPositiveTitle: positiveButtonTitle,
          )
        ],
      ),
    );
  }

  Visibility _buildBody() {
    return Visibility(
      visible: body.isNotEmpty,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        child: DesignText.body2(body),
      ),
    );
  }

  Visibility _buildTitle() {
    return Visibility(
      visible: title.isNotEmpty,
      child: Container(
        margin: EdgeInsets.only(top: image == null ? 0 : 12),
        child: DesignText.h6(title).bold,
      ),
    );
  }
}

class _DialogImage extends StatelessWidget {
  const _DialogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final DesignImage? image;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: image != null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: image ?? const SizedBox(),
      ),
    );
  }
}

class _DialogButtons extends StatelessWidget {
  const _DialogButtons({
    Key? key,
    required this.onPositive,
    required this.onNegative,
    required this.onNegativetitle,
    required this.onPositiveTitle,
  }) : super(key: key);
  final String onNegativetitle;
  final String onPositiveTitle;
  final Function()? onPositive;
  final Function()? onNegative;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: onPositive != null || onNegative != null,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Visibility(
              visible: onNegative != null,
              child: Expanded(
                child: DesignButton(
                  backgroundColor: DesignColors.primaryLight2,
                  child: DesignText.body1(onNegativetitle)
                      .bold
                      .overideColor(DesignColors.primaryBase),
                  onTap: () {},
                ),
              ),
            ),
            Visibility(
              visible: onPositive != null,
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: onNegative == null ? 0 : 12,
                  ),
                  child: DesignButton(
                    child: DesignText.body1(onPositiveTitle)
                        .bold
                        .overideColor(DesignColors.white),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
