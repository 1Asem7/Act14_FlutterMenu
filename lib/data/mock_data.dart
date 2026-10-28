// Modelos simples y datos de prueba (sin backend).

// Persona del listado "People".
class Person {
  final String name;
  final String status;
  final bool isOnline;

  const Person({
    required this.name,
    required this.status,
    required this.isOnline,
  });
}

// Conversación del listado "Chats".
class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;

  const Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
  });
}

// Tipos de llamada posibles.
enum CallType { incoming, outgoing, missed }

// Llamada del listado "Calls".
class Call {
  final String name;
  final CallType type;
  final String time;

  const Call({
    required this.name,
    required this.type,
    required this.time,
  });
}

// Obtiene las iniciales de un nombre (ej. "Ana López" -> "AL").
String initialsOf(String name) {
  final parts = name.trim().split(' ');
  if (parts.length == 1) return parts.first[0].toUpperCase();
  return (parts[0][0] + parts[1][0]).toUpperCase();
}

const List<Person> people = [
  Person(name: 'Ana López', status: 'Disponible', isOnline: true),
  Person(name: 'Carlos Ruiz', status: 'En una reunión', isOnline: false),
  Person(name: 'María Gómez', status: 'Estudiando Flutter 📚', isOnline: true),
  Person(name: 'Luis Herrera', status: 'Ocupado', isOnline: false),
  Person(name: 'Sofía Martínez', status: 'En el gimnasio', isOnline: true),
  Person(name: 'Diego Torres', status: 'Solo urgencias', isOnline: false),
  Person(name: 'Valeria Castro', status: 'Disponible', isOnline: true),
  Person(name: 'Jorge Ramírez', status: 'De vacaciones 🌴', isOnline: false),
  Person(name: 'Lucía Fernández', status: 'Programando...', isOnline: true),
  Person(name: 'Pablo Navarro', status: 'Disponible', isOnline: true),
];

const List<Chat> chats = [
  Chat(name: 'Ana López', lastMessage: '¿Nos vemos a las 5?', time: '10:42', unread: 2),
  Chat(name: 'Carlos Ruiz', lastMessage: 'Te envié el documento', time: '10:15', unread: 0),
  Chat(name: 'María Gómez', lastMessage: 'Ya terminé la actividad 14', time: '09:58', unread: 5),
  Chat(name: 'Luis Herrera', lastMessage: 'Ok, gracias', time: '09:30', unread: 0),
  Chat(name: 'Sofía Martínez', lastMessage: 'Jajaja 😂', time: 'Ayer', unread: 1),
  Chat(name: 'Diego Torres', lastMessage: 'Llámame cuando puedas', time: 'Ayer', unread: 0),
  Chat(name: 'Valeria Castro', lastMessage: '¿Viste el nuevo diseño?', time: 'Ayer', unread: 3),
  Chat(name: 'Jorge Ramírez', lastMessage: 'Foto enviada', time: 'Lun', unread: 0),
  Chat(name: 'Lucía Fernández', lastMessage: 'El build ya pasó ✅', time: 'Lun', unread: 0),
  Chat(name: 'Pablo Navarro', lastMessage: 'Nos vemos mañana', time: 'Dom', unread: 0),
];

const List<Call> calls = [
  Call(name: 'Ana López', type: CallType.incoming, time: 'Hoy, 10:20'),
  Call(name: 'Carlos Ruiz', type: CallType.outgoing, time: 'Hoy, 09:45'),
  Call(name: 'María Gómez', type: CallType.missed, time: 'Hoy, 08:10'),
  Call(name: 'Luis Herrera', type: CallType.outgoing, time: 'Ayer, 19:32'),
  Call(name: 'Sofía Martínez', type: CallType.incoming, time: 'Ayer, 17:05'),
  Call(name: 'Diego Torres', type: CallType.missed, time: 'Ayer, 12:48'),
  Call(name: 'Valeria Castro', type: CallType.incoming, time: 'Lun, 21:15'),
  Call(name: 'Jorge Ramírez', type: CallType.outgoing, time: 'Lun, 16:00'),
  Call(name: 'Lucía Fernández', type: CallType.missed, time: 'Dom, 11:22'),
];
