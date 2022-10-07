part of colorGlosarium;

class ColorList extends StatelessWidget {
  const ColorList({
    Key? key,
    required this.colors,
  }) : super(key: key);
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    ;
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: Row(
        children: [
          Text('Primary'),
          SizedBox(width: 20.w),
          Expanded(
            child: ListView.separated(
              itemCount: colors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ColorPlaceHolder(
                  color: colors[index],
                  colorName: colors[index].toString(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 20.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
