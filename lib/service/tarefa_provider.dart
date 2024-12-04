import 'package:flutter/foundation.dart';
import 'package:lista_tarefas/model/tarefa_model.dart';
import 'package:lista_tarefas/repository/tarefa_repository.dart';

class TarefaProvider extends ChangeNotifier {
  List<Tarefa> _tarefas = [];
  final TarefaRepository tarefaRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  TarefaProvider(this.tarefaRepository) {
    obterTarefas();
  }

  List<Tarefa> get tarefas => _tarefas;

  int get contagemTarefas => _tarefas.length;

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await tarefaRepository.criarTarefa(tarefa);
    obterTarefas();
  }

  Future<void> atualizarTarefa(Tarefa tarefa) async {
    await tarefaRepository.atualizarTarefa(tarefa);
    obterTarefas();
  }

  Future<void> deletarTarefa(String objectId) async {
    await tarefaRepository.deletarTarefa(objectId);
    obterTarefas();
  }

  Future<void> obterTarefas() async {
    _isLoading = true;
    notifyListeners();

    var tarefas = await tarefaRepository.obterTarefas();
    _tarefas = tarefas.results;

    _isLoading = false;
    notifyListeners();
  }
}
