import 'package:flutter/material.dart';

import 'screens/calls_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/people_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

// Raíz de la app: MaterialApp con el tema oscuro.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
    );
  }
}

// HomePage es StatefulWidget porque guarda qué pestaña está seleccionada.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Índice de la pestaña actual (0 = People, 1 = Chats, 2 = Calls).
  int _currentIndex = 0;

  // Lista de pantallas: el índice del menú elige cuál se muestra.
  final List<Widget> _screens = const [
    PeopleScreen(),
    ChatsScreen(),
    CallsScreen(),
  ];

  // Títulos del AppBar para cada pestaña.
  final List<String> _titles = const ['People', 'Chats', 'Calls'];

  // onTap: al tocar una pestaña actualizamos el índice con setState
  // para que Flutter vuelva a dibujar la pantalla.
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        // Degradado azul → violeta en el fondo del AppBar.
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradient),
        ),
      ),
      // Se muestra la pantalla correspondiente al índice actual.
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.violet,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
