import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
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
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        final isMissed = call.type == CallType.missed;
        // Las llamadas perdidas se resaltan en rojo suave.
        final typeColor = isMissed ? Colors.redAccent : AppColors.blue;

        return ListTile(
          leading: GradientAvatar(name: call.name),
          title: Text(
            call.name,
            style: TextStyle(color: isMissed ? Colors.redAccent : AppColors.text),
          ),
          subtitle: Row(
            children: [
              Icon(_iconFor(call.type), size: 16, color: typeColor),
              const SizedBox(width: 6),
              Text(
                '${_labelFor(call.type)} · ${call.time}',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.call_outlined, color: AppColors.violet),
            tooltip: 'Llamar',
            onPressed: () => showActionSnackBar(context, 'Llamando a ${call.name}...'),
          ),
          onTap: () => showActionSnackBar(context, 'Detalles de llamada con ${call.name}'),
        );
      },
    );
  }
}
