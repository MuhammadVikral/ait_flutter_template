import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Widget child;
  final Widget leading;

  DesignButton({
    Key? key,
    this.height = 34,
    double? width,
    Color? backgroundColor,
    required this.child,
    this.leading = const SizedBox(),
  })  : backgroundColor = backgroundColor ?? DesignColors.primaryBase,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading,
              child,
            ],
          ),
        ),
      ),
    );
  }
}
