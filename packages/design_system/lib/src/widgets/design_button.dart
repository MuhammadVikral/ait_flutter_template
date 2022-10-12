import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignButton extends StatelessWidget {
  const DesignButton.filled({
    Key? key,
    required this.args,
  }) : super(key: key);
  final DesignButtonArgs args;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: args.backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: args.child,
      ),
    );
  }
}

class DesignButtonArgs {
  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  DesignButtonArgs({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor = Colors.blue,
  });
}
