import 'package:lista_tarefas/repository/tarefa_repository.dart';
import 'package:lista_tarefas/service/custom_dio.dart';
import 'package:lista_tarefas/service/tarefa_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lista_tarefas/my_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final dio = CustomDio();
  runApp(ChangeNotifierProvider(
      create: (context) => TarefaProvider(TarefaRepository(dio)),
      child: const MyApp()));
}
