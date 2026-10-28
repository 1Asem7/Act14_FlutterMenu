import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/calls_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/people_screen.dart';
import 'theme.dart';
import 'widgets/glass_container.dart';

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
      // Limita la app a 440 px de ancho y la centra: en PC se ve como un teléfono.
      builder: (context, child) => ColoredBox(
        color: AppColors.background,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: child,
          ),
        ),
      ),
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

  // Crea un ítem del menú. El seleccionado (activeIcon) lleva detrás
  // una píldora violeta suave, como en One UI.
  BottomNavigationBarItem _navItem(IconData icon, String label) {
    const pillPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
    return BottomNavigationBarItem(
      icon: Padding(padding: pillPadding, child: Icon(icon)),
      activeIcon: Container(
        padding: pillPadding,
        decoration: BoxDecoration(
          color: AppColors.violet.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack: detrás va el fondo con círculos difusos, delante el Scaffold
    // transparente. Así el vidrio (blur) tiene colores que difuminar.
    return Stack(
      children: [
        const Positioned.fill(child: _GlowBackground()),
        Scaffold(
          backgroundColor: Colors.transparent,
          // El contenido pasa por detrás del AppBar y del menú flotante.
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(_titles[_currentIndex]),
            // Título sobre vidrio difuminado.
            flexibleSpace: const GlassContainer(radius: 0, child: SizedBox.expand()),
          ),
          // AnimatedSwitcher: transición suave (fundido) al cambiar de pestaña.
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: KeyedSubtree(
              key: ValueKey(_currentIndex),
              child: _screens[_currentIndex],
            ),
          ),
          // Menú flotante de vidrio con margen de 16 a los lados y abajo.
          bottomNavigationBar: SafeArea(
            child: GlassContainer(
              radius: 28,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onItemTapped,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: AppColors.violet,
                unselectedItemColor: AppColors.textMuted,
                type: BottomNavigationBarType.fixed,
                iconSize: 22,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
                unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w400),
                items: [
                  _navItem(Icons.people_outline, 'People'),
                  _navItem(Icons.chat_bubble_outline, 'Chats'),
                  _navItem(Icons.call_outlined, 'Calls'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Fondo oscuro con círculos grandes y difusos (azul y violeta)
// para que el efecto de vidrio se note.
class _GlowBackground extends StatelessWidget {
  const _GlowBackground();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.background,
      child: Stack(
        children: [
          Positioned(top: -80, left: -100, child: _Blob(color: AppColors.blue, size: 340)),
          Positioned(top: 260, right: -120, child: _Blob(color: AppColors.violet, size: 380)),
          Positioned(bottom: -60, left: -60, child: _Blob(color: AppColors.blue, size: 300, opacity: 0.35)),
        ],
      ),
    );
  }
}

// Un círculo difuso: degradado radial que se desvanece hacia los bordes.
class _Blob extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;

  const _Blob({required this.color, required this.size, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: opacity), color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}
