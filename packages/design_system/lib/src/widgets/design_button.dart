import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color backgroundColor;
  final DesignButtonType? buttonType;
  final DesignText child;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;
  final Function() onTap;

  const DesignButton({
    Key? key,
    this.height = 34,
    double? width,
    Color? backgroundColor,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.buttonType = DesignButtonType.filled,
    required this.child,
    required this.onTap,
  })  : backgroundColor = enabled
            ? backgroundColor ?? DesignColors.primaryBase
            : DesignColors.disabled,
        width = width ?? double.infinity,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOutlinedType = buttonType == DesignButtonType.outlined;
    bool isFilledType = buttonType == DesignButtonType.filled;
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: !isFilledType ? Colors.transparent : backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: isOutlinedType
                ? Border.all(color: backgroundColor, width: 1)
                : null,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 16,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: leading != null,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: leading,
                  ),
                ),
                enabled ? child : child.overideColor(DesignColors.disabledText),
                Visibility(
                  visible: trailing != null,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: trailing,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DesignButtonType { filled, outlined, text }
