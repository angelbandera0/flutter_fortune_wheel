part of 'indicators.dart';

class _MarkerPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final Color shadowColor;
  final double strokeWidth;
  final double elevation;

  const _MarkerPainter({
    required this.fillColor,
    required this.borderColor,
    required this.shadowColor,
    this.strokeWidth = 1,
    this.elevation = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Path para la forma de marcador
    final Path path = Path()
      ..moveTo(width / 2, height) // Punto inferior
      ..quadraticBezierTo(width, height * 0.90, width / 2, 0) // Curva derecha hacia arriba
      ..quadraticBezierTo(0, height * 0.90, width / 2, height); // Curva izquierda hacia arriba

    // Pintura de relleno
    final Paint fillPaint = Paint()..color = fillColor;

    // Pintura del borde
    final Paint strokePaint = Paint()
      ..color = borderColor.withOpacity(0.8)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Dibujar la sombra
    canvas.drawShadow(path, shadowColor.withOpacity(0.8), elevation, true);

    // Dibujar la forma del marcador
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is _MarkerPainter) {
      return fillColor != oldDelegate.fillColor ||
          strokeWidth != oldDelegate.strokeWidth ||
          elevation != oldDelegate.elevation;
    }
    return false;
  }
}

class _Marker extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color shadowColor;

  final double elevation;

  const _Marker({
    required this.color,
    required this.borderColor,
    required this.shadowColor,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: const Size(80, 120), // Tamaño del marcador
      painter: _MarkerPainter(
        fillColor: color,
        borderColor: borderColor,
        shadowColor: shadowColor,
        strokeWidth: 2,
        elevation: elevation,
      ),
    );
  }
}
