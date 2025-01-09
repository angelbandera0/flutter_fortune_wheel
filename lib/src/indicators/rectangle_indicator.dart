part of 'indicators.dart';

class RectangleIndicator extends StatelessWidget {
  final double borderWidth;
  final Color borderColor;
  final Color shadowColor;
  final Color color;

  const RectangleIndicator({
    Key? key,
    this.borderWidth = 2,
    this.borderColor = Colors.transparent,
    this.shadowColor = Colors.transparent,
    this.color = Colors.transparent,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor =
        this.borderColor ?? Theme.of(context).colorScheme.secondary;

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;

      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: _Rectangle(
              width: width,
              height: height,
              borderColor: borderColor,
              borderWidth: borderWidth,
              color: color,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: width / 2,
              height: height / 10,
              child: _Marker(
                color: color,
                    borderColor: borderColor,
                shadowColor: shadowColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: _math.pi,
              child: SizedBox(
                width: width / 2,
                height: height / 10,
                child: _Marker(
                  color: color,
                  borderColor: borderColor,
                  shadowColor: shadowColor,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
