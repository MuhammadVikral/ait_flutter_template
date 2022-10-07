library colorGlosarium;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part './widgets/color_placeholder.dart';

class ColorGlosariumPage extends StatelessWidget {
  const ColorGlosariumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ColorPlaceHolder(
          color: Colors.red,
        )
      ],
    );
  }
}
