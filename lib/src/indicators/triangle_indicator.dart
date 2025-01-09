part of 'indicators.dart';

class TriangleIndicator extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final Color? shadowColor;
  final double width;
  final double height;
  final double elevation;

  const TriangleIndicator({
    Key? key,
    this.color,
    this.borderColor,
    this.shadowColor,
    this.width = 36.0,
    this.height = 36.0,
    this.elevation = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Transform.rotate(
      angle: _math.pi,
      child: SizedBox(
        width: width,
        height: height,
        child: _Marker(
          color: color ?? theme.colorScheme.secondary,
          borderColor: borderColor ?? theme.colorScheme.secondary,
          shadowColor: shadowColor ?? theme.colorScheme.secondary,
          elevation: elevation,
        ),
      ),
    );
  }
}
