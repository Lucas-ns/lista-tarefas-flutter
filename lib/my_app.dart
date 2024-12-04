import 'package:flutter/material.dart';
import 'package:lista_tarefas/pages/tarefas_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const TarefasPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
