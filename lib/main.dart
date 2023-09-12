import 'package:flutter/material.dart';
import 'package:patron_provider/BigData/userdata.dart';
import 'package:patron_provider/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TareasUse());
}

class TareasUse extends StatelessWidget {
  const TareasUse({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TareasProvider>(
      create: (context) => TareasProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tareas User',
        theme: ThemeData(colorScheme: const ColorScheme.dark()),
        home: const HomeScreen(),
      ),
    );
  }
}
