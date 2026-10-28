import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/gradient_avatar.dart';

// Pantalla "Chats": conversaciones con último mensaje, hora y no leídos.
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: GradientAvatar(name: chat.name),
          title: Text(chat.name),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          // Hora y badge de mensajes no leídos.
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat.time,
                style: TextStyle(
                  fontSize: 12,
                  color: chat.unread > 0 ? AppColors.violet : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              if (chat.unread > 0)
                Badge(
                  label: Text('${chat.unread}'),
                  backgroundColor: AppColors.violet,
                  textColor: Colors.white,
                )
              else
                const SizedBox(height: 16),
            ],
          ),
          onTap: () => showActionSnackBar(context, 'Abriendo chat con ${chat.name}'),
        );
      },
    );
  }
}
