import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../data/jogo_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});

final jogoRepositoryProvider = Provider<JogoRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return JogoRepository(database);
});

final jogosProvider = FutureProvider<List<Jogo>>((ref) async {
  final repository = ref.watch(jogoRepositoryProvider);
  return repository.listarJogos();
});

final jogoViewModelProvider = Provider<JogoViewModel>((ref) {
  final repository = ref.watch(jogoRepositoryProvider);
  return JogoViewModel(ref, repository);
});

class JogoViewModel {
  final Ref ref;
  final JogoRepository repository;

  JogoViewModel(this.ref, this.repository);

  Future<void> salvarJogo({
    Jogo? jogoExistente,
    required String nome,
    required String status,
    required int conquistasAtuais,
    required int conquistasTotal,
    required double nota,
    required String dataInicio,
    required String dataFim,
  }) async {
    if (jogoExistente == null) {
      await repository.cadastrarJogo(JogosCompanion.insert(
        nome: nome,
        status: status,
        conquistasAtuais: conquistasAtuais,
        conquistasTotal: conquistasTotal,
        nota: nota,
        dataInicio: dataInicio,
        dataFim: dataFim,
      ));
    } else {
      await repository.atualizarJogo(jogoExistente.copyWith(
        nome: nome,
        status: status,
        conquistasAtuais: conquistasAtuais,
        conquistasTotal: conquistasTotal,
        nota: nota,
        dataInicio: dataInicio,
        dataFim: dataFim,
      ));
    }
    ref.invalidate(jogosProvider);
  }

  Future<void> removerJogo(int id) async {
    await repository.removerJogo(id);
    ref.invalidate(jogosProvider);
  }
}
