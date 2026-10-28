import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/gradient_avatar.dart';

// Pantalla "People": listado de personas con avatar, nombre y estado.
class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView.builder construye solo los elementos visibles de la lista.
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return ListTile(
          leading: GradientAvatar(name: person.name),
          title: Text(person.name),
          subtitle: Text(
            person.status,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          // Punto verde/gris que indica si la persona está en línea.
          trailing: Icon(
            Icons.circle,
            size: 10,
            color: person.isOnline ? Colors.greenAccent : AppColors.textSecondary,
          ),
          onTap: () => showActionSnackBar(context, 'Viendo perfil de ${person.name}'),
        );
      },
    );
  }
}
