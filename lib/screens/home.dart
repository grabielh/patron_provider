import 'package:flutter/material.dart';
import 'package:patron_provider/screens/agregar.dart';
import 'package:patron_provider/screens/history.dart';
import 'package:patron_provider/screens/question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> pageScreens = const [
    HistoryTarea(),
    AgregarTarea(),
    QuestionTarea()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pageScreens[index],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.history), label: 'history'),
          NavigationDestination(
              icon: Icon(Icons.add_box_outlined), label: 'agregar tarea'),
          NavigationDestination(
              icon: Icon(Icons.query_stats_outlined), label: 'question')
        ],
        onDestinationSelected: (value) {
          setState(
            () {
              index = value;
            },
          );
        },
        selectedIndex: index,
      ),
    );
  }
}
