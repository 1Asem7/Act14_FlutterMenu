import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';

// Avatar circular con degradado azul → violeta y las iniciales del nombre.
class GradientAvatar extends StatelessWidget {
  final String name;
  final double size;

  const GradientAvatar({super.key, required this.name, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.gradient,
      ),
      child: Text(
        initialsOf(name),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Muestra un SnackBar que simula una acción (ej. "Abriendo chat con Ana").
void showActionSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
