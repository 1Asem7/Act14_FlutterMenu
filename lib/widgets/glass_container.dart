import 'dart:ui';

import 'package:flutter/material.dart';

// Contenedor de "vidrio difuminado" estilo One UI: desenfoca lo que hay
// detrás (BackdropFilter) y encima pone un blanco muy transparente con un
// borde fino. Se reutiliza en el AppBar, el menú inferior y las tarjetas.
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry margin;

  const GlassContainer({
    super.key,
    required this.child,
    this.radius = 24,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      // ClipRRect limita el desenfoque a la forma redondeada.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
            // Material transparente para que el efecto al tocar (ripple) se vea.
            child: Material(type: MaterialType.transparency, child: child),
          ),
        ),
      ),
    );
  }
}
