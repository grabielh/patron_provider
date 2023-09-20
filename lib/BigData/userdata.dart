import 'package:flutter/material.dart';

// Proveedor que gestiona una lista de tareas.
class TareasProvider extends ChangeNotifier {
  // Lista de tareas iniciales.
  final List<String> _tareas = [
    'Hacer deporte',
    'Tender su cama',
    'Desayunar',
    'consumir durante el dia',
    'lavarse los dientes',
    'bañarse'
  ];

  // Getter para obtener la lista de tareas.
  List<String> get tareas => _tareas;

  // Agrega una nueva tarea a la lista y notifica a los oyentes del cambio.
  void agregarTarea(String texto) {
    _tareas.add(texto);
    notifyListeners();
  }
}
