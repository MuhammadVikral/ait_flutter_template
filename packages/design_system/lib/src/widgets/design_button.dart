import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color backgroundColor;
  final DesignText child;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;

  const DesignButton({
    Key? key,
    this.height = 34,
    double? width,
    Color? backgroundColor,
    required this.child,
    this.leading,
    this.trailing,
    this.enabled = true,
  })  : backgroundColor = enabled
            ? backgroundColor ?? DesignColors.primaryBase
            : DesignColors.disabled,
        width = width ?? double.infinity,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
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
