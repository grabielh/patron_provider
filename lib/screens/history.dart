import 'package:flutter/material.dart';
import 'package:patron_provider/BigData/userdata.dart';
import 'package:provider/provider.dart';

class HistoryTarea extends StatefulWidget {
  const HistoryTarea({super.key});

  @override
  State<HistoryTarea> createState() => _HistoryTareaState();
}

class _HistoryTareaState extends State<HistoryTarea> {
  void reducir(int index) {
    final dateUser = Provider.of<TareasProvider>(context, listen: false);
    if (index >= 0 && index < dateUser.tareas.length) {
      dateUser.tareas.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateUser = Provider.of<TareasProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dateUser.tareas.length,
              itemBuilder: (context, index) {
                String tarea = dateUser.tareas[index];
                return SingleChildScrollView(
                  child: Card(
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            reducir(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Eliminado')));
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tarea,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      trailing: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
