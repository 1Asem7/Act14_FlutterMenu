# Actividad 14 - Flutter menu's BottomNavigationBar

App Flutter con un `BottomNavigationBar` de 3 pestañas y funcionamiento simulado (sin backend):

- **People**: personas con avatar de iniciales, nombre, estado e indicador de en línea.
- **Chats**: conversaciones con último mensaje, hora y badge de no leídos.
- **Calls**: llamadas entrantes, salientes y perdidas, con hora y botón de llamar.

Al tocar un elemento aparece un `SnackBar` que simula la acción (ej. *"Abriendo chat con Ana López"*).
Diseño en modo oscuro (Material 3) con paleta negro / azul / violeta y degradado azul→violeta.

## Estructura

```
lib/
  main.dart                  MaterialApp + HomePage con el BottomNavigationBar
  theme.dart                 Paleta de colores y tema oscuro
  data/mock_data.dart        Modelos (Person, Chat, Call) y datos de prueba
  screens/people_screen.dart
  screens/chats_screen.dart
  screens/calls_screen.dart
  widgets/gradient_avatar.dart  Avatar con degradado + helper del SnackBar
public/                      Build web de Flutter (se sube a git para desplegar)
server.js                    Servidor Node sin dependencias que sirve public/
```

## Cómo correr (desarrollo)

```bash
flutter pub get
flutter run -d chrome
```

## Cómo desplegar (HubDeploy / Node)

El build web ya está en `public/`. Solo hace falta Node 18+:

```bash
npm start            # http://localhost:3000  (o el puerto de process.env.PORT)
```

Si cambias el código Dart, regenera el build antes de hacer commit:

```bash
npm run build:web    # flutter build web --release --base-href / --output public
```

También hay un `Dockerfile` mínimo (`node:20-alpine`).

## ¿Cómo funciona el BottomNavigationBar?

1. `HomePage` es un **StatefulWidget** que guarda la pestaña actual en `_currentIndex`.
2. Hay una **lista de pantallas** `_screens = [PeopleScreen(), ChatsScreen(), CallsScreen()]`.
3. El `body` del `Scaffold` muestra `_screens[_currentIndex]`.
4. El `BottomNavigationBar` recibe `currentIndex: _currentIndex` (para resaltar el ítem en violeta)
   y `onTap: _onItemTapped`.
5. Al tocar un ítem, `onTap` llama a **`setState`** con el nuevo índice y Flutter vuelve a dibujar
   la pantalla correspondiente.

Cada pantalla usa `ListView.builder` + `ListTile` para construir la lista a partir de los datos de prueba.
