import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';
import '../widgets/gradient_avatar.dart';

// Pantalla "People": listado de personas con avatar, nombre y estado.
class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Espacio que ocupan el AppBar (arriba) y el menú flotante (abajo),
    // para que ningún elemento quede tapado por el vidrio.
    final insets = MediaQuery.paddingOf(context);

    // ListView.separated construye solo los elementos visibles y deja
    // 8 px entre tarjetas.
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, insets.top + 8, 16, insets.bottom + 16),
      itemCount: people.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final person = people[index];
        // Cada persona va en su propia tarjeta de vidrio.
        return GlassContainer(
          child: ListTile(
            leading: GradientAvatar(name: person.name),
            title: Text(person.name),
            subtitle: Text(person.status),
            // Punto verde/gris que indica si la persona está en línea.
            trailing: Icon(
              Icons.circle,
              size: 10,
              color: person.isOnline ? Colors.greenAccent : AppColors.textMuted,
            ),
            onTap: () => showActionSnackBar(context, 'Viendo perfil de ${person.name}'),
          ),
        );
      },
    );
  }
}
