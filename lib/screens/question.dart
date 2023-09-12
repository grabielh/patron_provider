import 'package:flutter/material.dart';
import 'package:patron_provider/BigData/userdata.dart';
import 'package:provider/provider.dart';

class QuestionTarea extends StatefulWidget {
  const QuestionTarea({super.key});

  @override
  State<QuestionTarea> createState() => _QuestionTareaState();
}

class _QuestionTareaState extends State<QuestionTarea> {
  late List<bool> nocheckbo;
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    final dateUser = Provider.of<TareasProvider>(context, listen: false);
    nocheckbo = List.generate(dateUser.tareas.length, (index) => false);
  }

  double getProgressValue() {
    int selectedConunt = nocheckbo.where((element) => element).length;
    if (selectedConunt == 0) {
      return 0.0;
    } else {
      return progressValue = selectedConunt / nocheckbo.length.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateUser = Provider.of<TareasProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Progreso: ${(getProgressValue() * 100).toStringAsFixed(1)}%',
                ),
                const SizedBox(height: 16.0),
                LinearProgressIndicator(
                  value: getProgressValue(),
                  minHeight: 20.0,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dateUser.tareas.length,
              itemBuilder: (context, index) {
                String tarea = dateUser.tareas[index];
                return SingleChildScrollView(
                  child: Card(
                    child: ListTile(
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
                        value: nocheckbo[index],
                        onChanged: (value) {
                          setState(() {
                            nocheckbo[index] = value ?? false;
                            progressValue = getProgressValue();
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Guardar cambios')),
          ),
        ],
      ),
    );
  }
}
