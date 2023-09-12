import 'package:flutter/material.dart';
import 'package:patron_provider/BigData/userdata.dart';
import 'package:provider/provider.dart';

class AgregarTarea extends StatefulWidget {
  const AgregarTarea({super.key});

  @override
  State<AgregarTarea> createState() => _AgregarTareaState();
}

class _AgregarTareaState extends State<AgregarTarea> {
  final TextEditingController tarea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dateUser = Provider.of<TareasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4a4e68),
        title: TextField(
          controller: tarea,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(labelText: 'Ingresar nueva tarea'),
        ),
        actions: [
          Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (tarea.text.isNotEmpty) {
                      dateUser.tareas.add(tarea.text.trim());
                      tarea.clear();
                      FocusScope.of(context).unfocus();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Agregue una tarea')));
                    }
                  });
                },
                child: const Text('Guardar'),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dateUser.tareas.length,
              itemBuilder: (context, index) {
                String tareas = dateUser.tareas[index];
                return SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            tareas,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
