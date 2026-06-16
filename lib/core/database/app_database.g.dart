// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $JogosTable extends Jogos with TableInfo<$JogosTable, Jogo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JogosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 120),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conquistasAtuaisMeta =
      const VerificationMeta('conquistasAtuais');
  @override
  late final GeneratedColumn<int> conquistasAtuais = GeneratedColumn<int>(
      'conquistas_atuais', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _conquistasTotalMeta =
      const VerificationMeta('conquistasTotal');
  @override
  late final GeneratedColumn<int> conquistasTotal = GeneratedColumn<int>(
      'conquistas_total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notaMeta = const VerificationMeta('nota');
  @override
  late final GeneratedColumn<double> nota = GeneratedColumn<double>(
      'nota', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dataInicioMeta =
      const VerificationMeta('dataInicio');
  @override
  late final GeneratedColumn<String> dataInicio = GeneratedColumn<String>(
      'data_inicio', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataFimMeta =
      const VerificationMeta('dataFim');
  @override
  late final GeneratedColumn<String> dataFim = GeneratedColumn<String>(
      'data_fim', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        status,
        conquistasAtuais,
        conquistasTotal,
        nota,
        dataInicio,
        dataFim
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jogos';
  @override
  VerificationContext validateIntegrity(Insertable<Jogo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('conquistas_atuais')) {
      context.handle(
          _conquistasAtuaisMeta,
          conquistasAtuais.isAcceptableOrUnknown(
              data['conquistas_atuais']!, _conquistasAtuaisMeta));
    } else if (isInserting) {
      context.missing(_conquistasAtuaisMeta);
    }
    if (data.containsKey('conquistas_total')) {
      context.handle(
          _conquistasTotalMeta,
          conquistasTotal.isAcceptableOrUnknown(
              data['conquistas_total']!, _conquistasTotalMeta));
    } else if (isInserting) {
      context.missing(_conquistasTotalMeta);
    }
    if (data.containsKey('nota')) {
      context.handle(
          _notaMeta, nota.isAcceptableOrUnknown(data['nota']!, _notaMeta));
    } else if (isInserting) {
      context.missing(_notaMeta);
    }
    if (data.containsKey('data_inicio')) {
      context.handle(
          _dataInicioMeta,
          dataInicio.isAcceptableOrUnknown(
              data['data_inicio']!, _dataInicioMeta));
    } else if (isInserting) {
      context.missing(_dataInicioMeta);
    }
    if (data.containsKey('data_fim')) {
      context.handle(_dataFimMeta,
          dataFim.isAcceptableOrUnknown(data['data_fim']!, _dataFimMeta));
    } else if (isInserting) {
      context.missing(_dataFimMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Jogo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Jogo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      conquistasAtuais: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}conquistas_atuais'])!,
      conquistasTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}conquistas_total'])!,
      nota: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}nota'])!,
      dataInicio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_inicio'])!,
      dataFim: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_fim'])!,
    );
  }

  @override
  $JogosTable createAlias(String alias) {
    return $JogosTable(attachedDatabase, alias);
  }
}

class Jogo extends DataClass implements Insertable<Jogo> {
  final int id;
  final String nome;
  final String status;
  final int conquistasAtuais;
  final int conquistasTotal;
  final double nota;
  final String dataInicio;
  final String dataFim;
  const Jogo(
      {required this.id,
      required this.nome,
      required this.status,
      required this.conquistasAtuais,
      required this.conquistasTotal,
      required this.nota,
      required this.dataInicio,
      required this.dataFim});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['status'] = Variable<String>(status);
    map['conquistas_atuais'] = Variable<int>(conquistasAtuais);
    map['conquistas_total'] = Variable<int>(conquistasTotal);
    map['nota'] = Variable<double>(nota);
    map['data_inicio'] = Variable<String>(dataInicio);
    map['data_fim'] = Variable<String>(dataFim);
    return map;
  }

  JogosCompanion toCompanion(bool nullToAbsent) {
    return JogosCompanion(
      id: Value(id),
      nome: Value(nome),
      status: Value(status),
      conquistasAtuais: Value(conquistasAtuais),
      conquistasTotal: Value(conquistasTotal),
      nota: Value(nota),
      dataInicio: Value(dataInicio),
      dataFim: Value(dataFim),
    );
  }

  factory Jogo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Jogo(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      status: serializer.fromJson<String>(json['status']),
      conquistasAtuais: serializer.fromJson<int>(json['conquistasAtuais']),
      conquistasTotal: serializer.fromJson<int>(json['conquistasTotal']),
      nota: serializer.fromJson<double>(json['nota']),
      dataInicio: serializer.fromJson<String>(json['dataInicio']),
      dataFim: serializer.fromJson<String>(json['dataFim']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'status': serializer.toJson<String>(status),
      'conquistasAtuais': serializer.toJson<int>(conquistasAtuais),
      'conquistasTotal': serializer.toJson<int>(conquistasTotal),
      'nota': serializer.toJson<double>(nota),
      'dataInicio': serializer.toJson<String>(dataInicio),
      'dataFim': serializer.toJson<String>(dataFim),
    };
  }

  Jogo copyWith(
          {int? id,
          String? nome,
          String? status,
          int? conquistasAtuais,
          int? conquistasTotal,
          double? nota,
          String? dataInicio,
          String? dataFim}) =>
      Jogo(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        status: status ?? this.status,
        conquistasAtuais: conquistasAtuais ?? this.conquistasAtuais,
        conquistasTotal: conquistasTotal ?? this.conquistasTotal,
        nota: nota ?? this.nota,
        dataInicio: dataInicio ?? this.dataInicio,
        dataFim: dataFim ?? this.dataFim,
      );
  Jogo copyWithCompanion(JogosCompanion data) {
    return Jogo(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      status: data.status.present ? data.status.value : this.status,
      conquistasAtuais: data.conquistasAtuais.present
          ? data.conquistasAtuais.value
          : this.conquistasAtuais,
      conquistasTotal: data.conquistasTotal.present
          ? data.conquistasTotal.value
          : this.conquistasTotal,
      nota: data.nota.present ? data.nota.value : this.nota,
      dataInicio:
          data.dataInicio.present ? data.dataInicio.value : this.dataInicio,
      dataFim: data.dataFim.present ? data.dataFim.value : this.dataFim,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Jogo(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('status: $status, ')
          ..write('conquistasAtuais: $conquistasAtuais, ')
          ..write('conquistasTotal: $conquistasTotal, ')
          ..write('nota: $nota, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFim: $dataFim')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, status, conquistasAtuais,
      conquistasTotal, nota, dataInicio, dataFim);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Jogo &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.status == this.status &&
          other.conquistasAtuais == this.conquistasAtuais &&
          other.conquistasTotal == this.conquistasTotal &&
          other.nota == this.nota &&
          other.dataInicio == this.dataInicio &&
          other.dataFim == this.dataFim);
}

class JogosCompanion extends UpdateCompanion<Jogo> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> status;
  final Value<int> conquistasAtuais;
  final Value<int> conquistasTotal;
  final Value<double> nota;
  final Value<String> dataInicio;
  final Value<String> dataFim;
  const JogosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.status = const Value.absent(),
    this.conquistasAtuais = const Value.absent(),
    this.conquistasTotal = const Value.absent(),
    this.nota = const Value.absent(),
    this.dataInicio = const Value.absent(),
    this.dataFim = const Value.absent(),
  });
  JogosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String status,
    required int conquistasAtuais,
    required int conquistasTotal,
    required double nota,
    required String dataInicio,
    required String dataFim,
  })  : nome = Value(nome),
        status = Value(status),
        conquistasAtuais = Value(conquistasAtuais),
        conquistasTotal = Value(conquistasTotal),
        nota = Value(nota),
        dataInicio = Value(dataInicio),
        dataFim = Value(dataFim);
  static Insertable<Jogo> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? status,
    Expression<int>? conquistasAtuais,
    Expression<int>? conquistasTotal,
    Expression<double>? nota,
    Expression<String>? dataInicio,
    Expression<String>? dataFim,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (status != null) 'status': status,
      if (conquistasAtuais != null) 'conquistas_atuais': conquistasAtuais,
      if (conquistasTotal != null) 'conquistas_total': conquistasTotal,
      if (nota != null) 'nota': nota,
      if (dataInicio != null) 'data_inicio': dataInicio,
      if (dataFim != null) 'data_fim': dataFim,
    });
  }

  JogosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? status,
      Value<int>? conquistasAtuais,
      Value<int>? conquistasTotal,
      Value<double>? nota,
      Value<String>? dataInicio,
      Value<String>? dataFim}) {
    return JogosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      status: status ?? this.status,
      conquistasAtuais: conquistasAtuais ?? this.conquistasAtuais,
      conquistasTotal: conquistasTotal ?? this.conquistasTotal,
      nota: nota ?? this.nota,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFim: dataFim ?? this.dataFim,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (conquistasAtuais.present) {
      map['conquistas_atuais'] = Variable<int>(conquistasAtuais.value);
    }
    if (conquistasTotal.present) {
      map['conquistas_total'] = Variable<int>(conquistasTotal.value);
    }
    if (nota.present) {
      map['nota'] = Variable<double>(nota.value);
    }
    if (dataInicio.present) {
      map['data_inicio'] = Variable<String>(dataInicio.value);
    }
    if (dataFim.present) {
      map['data_fim'] = Variable<String>(dataFim.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JogosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('status: $status, ')
          ..write('conquistasAtuais: $conquistasAtuais, ')
          ..write('conquistasTotal: $conquistasTotal, ')
          ..write('nota: $nota, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFim: $dataFim')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JogosTable jogos = $JogosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jogos];
}

typedef $$JogosTableCreateCompanionBuilder = JogosCompanion Function({
  Value<int> id,
  required String nome,
  required String status,
  required int conquistasAtuais,
  required int conquistasTotal,
  required double nota,
  required String dataInicio,
  required String dataFim,
});
typedef $$JogosTableUpdateCompanionBuilder = JogosCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<String> status,
  Value<int> conquistasAtuais,
  Value<int> conquistasTotal,
  Value<double> nota,
  Value<String> dataInicio,
  Value<String> dataFim,
});

class $$JogosTableFilterComposer extends Composer<_$AppDatabase, $JogosTable> {
  $$JogosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get conquistasAtuais => $composableBuilder(
      column: $table.conquistasAtuais,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get conquistasTotal => $composableBuilder(
      column: $table.conquistasTotal,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get nota => $composableBuilder(
      column: $table.nota, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataInicio => $composableBuilder(
      column: $table.dataInicio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataFim => $composableBuilder(
      column: $table.dataFim, builder: (column) => ColumnFilters(column));
}

class $$JogosTableOrderingComposer
    extends Composer<_$AppDatabase, $JogosTable> {
  $$JogosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get conquistasAtuais => $composableBuilder(
      column: $table.conquistasAtuais,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get conquistasTotal => $composableBuilder(
      column: $table.conquistasTotal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get nota => $composableBuilder(
      column: $table.nota, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataInicio => $composableBuilder(
      column: $table.dataInicio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataFim => $composableBuilder(
      column: $table.dataFim, builder: (column) => ColumnOrderings(column));
}

class $$JogosTableAnnotationComposer
    extends Composer<_$AppDatabase, $JogosTable> {
  $$JogosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get conquistasAtuais => $composableBuilder(
      column: $table.conquistasAtuais, builder: (column) => column);

  GeneratedColumn<int> get conquistasTotal => $composableBuilder(
      column: $table.conquistasTotal, builder: (column) => column);

  GeneratedColumn<double> get nota =>
      $composableBuilder(column: $table.nota, builder: (column) => column);

  GeneratedColumn<String> get dataInicio => $composableBuilder(
      column: $table.dataInicio, builder: (column) => column);

  GeneratedColumn<String> get dataFim =>
      $composableBuilder(column: $table.dataFim, builder: (column) => column);
}

class $$JogosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JogosTable,
    Jogo,
    $$JogosTableFilterComposer,
    $$JogosTableOrderingComposer,
    $$JogosTableAnnotationComposer,
    $$JogosTableCreateCompanionBuilder,
    $$JogosTableUpdateCompanionBuilder,
    (Jogo, BaseReferences<_$AppDatabase, $JogosTable, Jogo>),
    Jogo,
    PrefetchHooks Function()> {
  $$JogosTableTableManager(_$AppDatabase db, $JogosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JogosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JogosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JogosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> conquistasAtuais = const Value.absent(),
            Value<int> conquistasTotal = const Value.absent(),
            Value<double> nota = const Value.absent(),
            Value<String> dataInicio = const Value.absent(),
            Value<String> dataFim = const Value.absent(),
          }) =>
              JogosCompanion(
            id: id,
            nome: nome,
            status: status,
            conquistasAtuais: conquistasAtuais,
            conquistasTotal: conquistasTotal,
            nota: nota,
            dataInicio: dataInicio,
            dataFim: dataFim,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required String status,
            required int conquistasAtuais,
            required int conquistasTotal,
            required double nota,
            required String dataInicio,
            required String dataFim,
          }) =>
              JogosCompanion.insert(
            id: id,
            nome: nome,
            status: status,
            conquistasAtuais: conquistasAtuais,
            conquistasTotal: conquistasTotal,
            nota: nota,
            dataInicio: dataInicio,
            dataFim: dataFim,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JogosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JogosTable,
    Jogo,
    $$JogosTableFilterComposer,
    $$JogosTableOrderingComposer,
    $$JogosTableAnnotationComposer,
    $$JogosTableCreateCompanionBuilder,
    $$JogosTableUpdateCompanionBuilder,
    (Jogo, BaseReferences<_$AppDatabase, $JogosTable, Jogo>),
    Jogo,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JogosTableTableManager get jogos =>
      $$JogosTableTableManager(_db, _db.jogos);
}
