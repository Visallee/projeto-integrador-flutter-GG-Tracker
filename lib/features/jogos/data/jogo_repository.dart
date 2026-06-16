import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

class JogoRepository {
  final AppDatabase database;

  JogoRepository(this.database);

  Future<List<Jogo>> listarJogos() {
    return (database.select(database.jogos)
          ..orderBy([(t) => OrderingTerm.asc(t.nome)]))
        .get();
  }

  Future<void> cadastrarJogo(JogosCompanion jogo) async {
    await database.into(database.jogos).insert(jogo);
  }

  Future<void> atualizarJogo(Jogo jogo) async {
    await database.update(database.jogos).replace(jogo);
  }

  Future<void> removerJogo(int id) async {
    await (database.delete(database.jogos)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
