import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:act14_flutter_menu/main.dart';

void main() {
  testWidgets('BottomNavigationBar cambia de pestaña', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Inicia en People.
    expect(find.text('Ana López'), findsWidgets);
    expect(find.text('Disponible'), findsWidgets);

    // Cambia a Chats.
    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pumpAndSettle();
    expect(find.text('¿Nos vemos a las 5?'), findsOneWidget);

    // Cambia a Calls.
    await tester.tap(find.byIcon(Icons.call_outlined).last);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.call_missed), findsWidgets);
  });
}
