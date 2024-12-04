import 'package:flutter/material.dart';
import 'package:lista_tarefas/model/tarefa_model.dart';
import 'package:lista_tarefas/service/tarefa_provider.dart';
import 'package:provider/provider.dart';

class TarefasPage extends StatelessWidget {
  const TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _adicionarTarefa(BuildContext context) {
      final _descricaoController = TextEditingController();

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Adicionar Tarefa'),
              content: TextField(
                controller: _descricaoController,
                decoration:
                    const InputDecoration(hintText: "Descrição da tarefa"),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar')),
                TextButton(
                    onPressed: () {
                      final descricao = _descricaoController.text;
                      if (descricao.isNotEmpty) {
                        final tarefa = Tarefa.create(descricao, false);
                        Provider.of<TarefaProvider>(context, listen: false)
                            .adicionarTarefa(tarefa);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar"))
              ],
            );
          });
    }

    final tarefaProvider = Provider.of<TarefaProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: tarefaProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: tarefaProvider.contagemTarefas,
              itemBuilder: (context, index) {
                final tarefa = tarefaProvider.tarefas[index];
                return ListTile(
                  title: Text(tarefa.descricao),
                  leading: Checkbox(
                      value: tarefa.concluido,
                      onChanged: (value) {
                        final tarefaAtualizada = Tarefa.update(
                            tarefa.objectId, tarefa.descricao, value ?? false);
                        tarefaProvider.atualizarTarefa(tarefaAtualizada);
                      }),
                  trailing: IconButton(
                      onPressed: () {
                        tarefaProvider.deletarTarefa(tarefa.objectId);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarTarefa(context),
        child: const Icon(Icons.add),
      ),
    ));
  }
}
