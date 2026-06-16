import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('Jogo')
class Jogos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 120)();
  TextColumn get status => text()();
  IntColumn get conquistasAtuais => integer()();
  IntColumn get conquistasTotal => integer()();
  RealColumn get nota => real()();
  TextColumn get dataInicio => text()();
  TextColumn get dataFim => text()();
}

@DriftDatabase(tables: [Jogos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'gg_tracker_db'));

  @override
  int get schemaVersion => 1;
}
