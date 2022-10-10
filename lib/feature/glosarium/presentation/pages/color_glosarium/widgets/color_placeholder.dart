part of color_glosarium;

class ColorPlaceHolder extends StatelessWidget {
  const ColorPlaceHolder(
      {super.key, required this.color, required this.colorName});
  final Color color;
  final String colorName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.h,
      color: color,
      child: Text(colorName),
    );
  }
}
