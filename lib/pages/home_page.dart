import 'package:flutter/material.dart';
import 'package:lista_tarefas/model/tarefa_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var tarefaRepository = TarefaRepository();
  var tarefas = TarefaModel([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lista de Tarefas'),
      ),
      body: Text("Lista de Tarefas"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
