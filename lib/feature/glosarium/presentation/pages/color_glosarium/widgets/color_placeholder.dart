part of colorGlosarium;

class ColorPlaceHolder extends StatelessWidget {
  const ColorPlaceHolder({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.h,
      color: color,
    );
  }
}
