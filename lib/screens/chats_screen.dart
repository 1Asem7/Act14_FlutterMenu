import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';
import '../widgets/gradient_avatar.dart';

// Pantalla "Chats": conversaciones con último mensaje, hora y no leídos.
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Espacio del AppBar y del menú flotante para no tapar elementos.
    final insets = MediaQuery.paddingOf(context);

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, insets.top + 8, 16, insets.bottom + 16),
      itemCount: chats.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final chat = chats[index];
        return GlassContainer(
          child: ListTile(
            leading: GradientAvatar(name: chat.name),
            title: Text(chat.name),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // Hora y badge de mensajes no leídos.
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: chat.unread > 0 ? AppColors.violet : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                if (chat.unread > 0)
                  // Badge con degradado azul → violeta.
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${chat.unread}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 16),
              ],
            ),
            onTap: () => showActionSnackBar(context, 'Abriendo chat con ${chat.name}'),
          ),
        );
      },
    );
  }
}
