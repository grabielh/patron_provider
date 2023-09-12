import 'package:flutter/material.dart';

class TareasProvider extends ChangeNotifier {
  final List<String> _tareas = [
    'Hacer deporte',
    'Tender su cama',
    'Desayunar',
    'consumir durante el dia',
    'lavarse los dientes',
    'bañarse'
  ];

  List<String> get tareas => _tareas;

  void agregarTarea(String texto) {
    _tareas.add(texto);
    notifyListeners();
  }
}
