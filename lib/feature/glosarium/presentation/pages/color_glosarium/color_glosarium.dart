library colorGlosarium;

import 'package:ait_const/ait_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part './widgets/color_placeholder.dart';
part './widgets/color_list.dart';

class ColorGlosariumPage extends StatelessWidget {
  const ColorGlosariumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorList(colors: primaryList),
      ],
    );
  }
}

List<Color> get primaryList => [
      DesignColors.primaryLight2,
      DesignColors.primaryLight1,
      DesignColors.primaryBase,
      DesignColors.primaryDark1,
      DesignColors.primaryDark2,
    ];
