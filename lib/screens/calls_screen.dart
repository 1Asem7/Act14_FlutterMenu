import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';
import '../widgets/gradient_avatar.dart';

// Pantalla "Calls": historial de llamadas con tipo, hora y botón de llamar.
class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  // Icono según el tipo de llamada.
  IconData _iconFor(CallType type) {
    switch (type) {
      case CallType.incoming:
        return Icons.call_received;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_missed;
    }
  }

  // Texto según el tipo de llamada.
  String _labelFor(CallType type) {
    switch (type) {
      case CallType.incoming:
        return 'Entrante';
      case CallType.outgoing:
        return 'Saliente';
      case CallType.missed:
        return 'Perdida';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Espacio del AppBar y del menú flotante para no tapar elementos.
    final insets = MediaQuery.paddingOf(context);

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, insets.top + 8, 16, insets.bottom + 16),
      itemCount: calls.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final call = calls[index];
        final isMissed = call.type == CallType.missed;
        // Las llamadas perdidas se resaltan en rojo suave.
        final typeColor = isMissed ? Colors.redAccent : AppColors.blue;

        return GlassContainer(
          child: ListTile(
            leading: GradientAvatar(name: call.name),
            title: Text(
              call.name,
              style: TextStyle(color: isMissed ? Colors.redAccent : AppColors.text),
            ),
            subtitle: Row(
              children: [
                Icon(_iconFor(call.type), size: 14, color: typeColor),
                const SizedBox(width: 6),
                // Flexible + elipsis: el texto se recorta si no cabe.
                Flexible(
                  child: Text(
                    '${_labelFor(call.type)} · ${call.time}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.call_outlined, size: 20, color: AppColors.violet),
              tooltip: 'Llamar',
              visualDensity: VisualDensity.compact,
              onPressed: () => showActionSnackBar(context, 'Llamando a ${call.name}...'),
            ),
            onTap: () => showActionSnackBar(context, 'Detalles de llamada con ${call.name}'),
          ),
        );
      },
    );
  }
}
