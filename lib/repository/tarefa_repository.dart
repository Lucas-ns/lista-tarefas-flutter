import 'package:lista_tarefas/model/tarefa_model.dart';
import 'package:lista_tarefas/service/custom_dio.dart';

class TarefaRepository {
  CustomDio customDio = CustomDio();
  final _url = '/Tarefas';

  TarefaRepository(this.customDio);

  Future<TarefaModel> obterTarefas() async {
    try {
      var result = await customDio.dio.get(_url);

      return TarefaModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> criarTarefa(Tarefa tarefa) async {
    try {
      await customDio.dio.post(_url, data: tarefa.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizarTarefa(Tarefa tarefa) async {
    try {
      await customDio.dio
          .put('$_url/${tarefa.objectId}', data: tarefa.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletarTarefa(String objectId) async {
    try {
      await customDio.dio.delete('$_url/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
