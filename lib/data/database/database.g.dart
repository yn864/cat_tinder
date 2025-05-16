// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperamentMeta = const VerificationMeta(
    'temperament',
  );
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
    'temperament',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeSpanMeta = const VerificationMeta(
    'lifeSpan',
  );
  @override
  late final GeneratedColumn<String> lifeSpan = GeneratedColumn<String>(
    'life_span',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wikipediaUrlMeta = const VerificationMeta(
    'wikipediaUrl',
  );
  @override
  late final GeneratedColumn<String> wikipediaUrl = GeneratedColumn<String>(
    'wikipedia_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    imageUrl,
    breed,
    description,
    temperament,
    origin,
    lifeSpan,
    wikipediaUrl,
    likedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('temperament')) {
      context.handle(
        _temperamentMeta,
        temperament.isAcceptableOrUnknown(
          data['temperament']!,
          _temperamentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperamentMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('life_span')) {
      context.handle(
        _lifeSpanMeta,
        lifeSpan.isAcceptableOrUnknown(data['life_span']!, _lifeSpanMeta),
      );
    } else if (isInserting) {
      context.missing(_lifeSpanMeta);
    }
    if (data.containsKey('wikipedia_url')) {
      context.handle(
        _wikipediaUrlMeta,
        wikipediaUrl.isAcceptableOrUnknown(
          data['wikipedia_url']!,
          _wikipediaUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wikipediaUrlMeta);
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_likedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      breed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      temperament:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}temperament'],
          )!,
      origin:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}origin'],
          )!,
      lifeSpan:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}life_span'],
          )!,
      wikipediaUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}wikipedia_url'],
          )!,
      likedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}liked_at'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String id;
  final String imageUrl;
  final String breed;
  final String description;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String wikipediaUrl;
  final DateTime likedAt;
  const LikedCat({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.wikipediaUrl,
    required this.likedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed'] = Variable<String>(breed);
    map['description'] = Variable<String>(description);
    map['temperament'] = Variable<String>(temperament);
    map['origin'] = Variable<String>(origin);
    map['life_span'] = Variable<String>(lifeSpan);
    map['wikipedia_url'] = Variable<String>(wikipediaUrl);
    map['liked_at'] = Variable<DateTime>(likedAt);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breed: Value(breed),
      description: Value(description),
      temperament: Value(temperament),
      origin: Value(origin),
      lifeSpan: Value(lifeSpan),
      wikipediaUrl: Value(wikipediaUrl),
      likedAt: Value(likedAt),
    );
  }

  factory LikedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breed: serializer.fromJson<String>(json['breed']),
      description: serializer.fromJson<String>(json['description']),
      temperament: serializer.fromJson<String>(json['temperament']),
      origin: serializer.fromJson<String>(json['origin']),
      lifeSpan: serializer.fromJson<String>(json['lifeSpan']),
      wikipediaUrl: serializer.fromJson<String>(json['wikipediaUrl']),
      likedAt: serializer.fromJson<DateTime>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breed': serializer.toJson<String>(breed),
      'description': serializer.toJson<String>(description),
      'temperament': serializer.toJson<String>(temperament),
      'origin': serializer.toJson<String>(origin),
      'lifeSpan': serializer.toJson<String>(lifeSpan),
      'wikipediaUrl': serializer.toJson<String>(wikipediaUrl),
      'likedAt': serializer.toJson<DateTime>(likedAt),
    };
  }

  LikedCat copyWith({
    String? id,
    String? imageUrl,
    String? breed,
    String? description,
    String? temperament,
    String? origin,
    String? lifeSpan,
    String? wikipediaUrl,
    DateTime? likedAt,
  }) => LikedCat(
    id: id ?? this.id,
    imageUrl: imageUrl ?? this.imageUrl,
    breed: breed ?? this.breed,
    description: description ?? this.description,
    temperament: temperament ?? this.temperament,
    origin: origin ?? this.origin,
    lifeSpan: lifeSpan ?? this.lifeSpan,
    wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
    likedAt: likedAt ?? this.likedAt,
  );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breed: data.breed.present ? data.breed.value : this.breed,
      description:
          data.description.present ? data.description.value : this.description,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      origin: data.origin.present ? data.origin.value : this.origin,
      lifeSpan: data.lifeSpan.present ? data.lifeSpan.value : this.lifeSpan,
      wikipediaUrl:
          data.wikipediaUrl.present
              ? data.wikipediaUrl.value
              : this.wikipediaUrl,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('description: $description, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('wikipediaUrl: $wikipediaUrl, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    imageUrl,
    breed,
    description,
    temperament,
    origin,
    lifeSpan,
    wikipediaUrl,
    likedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breed == this.breed &&
          other.description == this.description &&
          other.temperament == this.temperament &&
          other.origin == this.origin &&
          other.lifeSpan == this.lifeSpan &&
          other.wikipediaUrl == this.wikipediaUrl &&
          other.likedAt == this.likedAt);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breed;
  final Value<String> description;
  final Value<String> temperament;
  final Value<String> origin;
  final Value<String> lifeSpan;
  final Value<String> wikipediaUrl;
  final Value<DateTime> likedAt;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breed = const Value.absent(),
    this.description = const Value.absent(),
    this.temperament = const Value.absent(),
    this.origin = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.wikipediaUrl = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breed,
    required String description,
    required String temperament,
    required String origin,
    required String lifeSpan,
    required String wikipediaUrl,
    required DateTime likedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       imageUrl = Value(imageUrl),
       breed = Value(breed),
       description = Value(description),
       temperament = Value(temperament),
       origin = Value(origin),
       lifeSpan = Value(lifeSpan),
       wikipediaUrl = Value(wikipediaUrl),
       likedAt = Value(likedAt);
  static Insertable<LikedCat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breed,
    Expression<String>? description,
    Expression<String>? temperament,
    Expression<String>? origin,
    Expression<String>? lifeSpan,
    Expression<String>? wikipediaUrl,
    Expression<DateTime>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breed != null) 'breed': breed,
      if (description != null) 'description': description,
      if (temperament != null) 'temperament': temperament,
      if (origin != null) 'origin': origin,
      if (lifeSpan != null) 'life_span': lifeSpan,
      if (wikipediaUrl != null) 'wikipedia_url': wikipediaUrl,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? id,
    Value<String>? imageUrl,
    Value<String>? breed,
    Value<String>? description,
    Value<String>? temperament,
    Value<String>? origin,
    Value<String>? lifeSpan,
    Value<String>? wikipediaUrl,
    Value<DateTime>? likedAt,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breed: breed ?? this.breed,
      description: description ?? this.description,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (lifeSpan.present) {
      map['life_span'] = Variable<String>(lifeSpan.value);
    }
    if (wikipediaUrl.present) {
      map['wikipedia_url'] = Variable<String>(wikipediaUrl.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('description: $description, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('wikipediaUrl: $wikipediaUrl, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [likedCats];
}

typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String id,
      required String imageUrl,
      required String breed,
      required String description,
      required String temperament,
      required String origin,
      required String lifeSpan,
      required String wikipediaUrl,
      required DateTime likedAt,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> id,
      Value<String> imageUrl,
      Value<String> breed,
      Value<String> description,
      Value<String> temperament,
      Value<String> origin,
      Value<String> lifeSpan,
      Value<String> wikipediaUrl,
      Value<DateTime> likedAt,
      Value<int> rowid,
    });

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeSpan => $composableBuilder(
    column: $table.lifeSpan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wikipediaUrl => $composableBuilder(
    column: $table.wikipediaUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeSpan => $composableBuilder(
    column: $table.lifeSpan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wikipediaUrl => $composableBuilder(
    column: $table.wikipediaUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => column,
  );

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get lifeSpan =>
      $composableBuilder(column: $table.lifeSpan, builder: (column) => column);

  GeneratedColumn<String> get wikipediaUrl => $composableBuilder(
    column: $table.wikipediaUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCat,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
          LikedCat,
          PrefetchHooks Function()
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> breed = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> temperament = const Value.absent(),
                Value<String> origin = const Value.absent(),
                Value<String> lifeSpan = const Value.absent(),
                Value<String> wikipediaUrl = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                id: id,
                imageUrl: imageUrl,
                breed: breed,
                description: description,
                temperament: temperament,
                origin: origin,
                lifeSpan: lifeSpan,
                wikipediaUrl: wikipediaUrl,
                likedAt: likedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String imageUrl,
                required String breed,
                required String description,
                required String temperament,
                required String origin,
                required String lifeSpan,
                required String wikipediaUrl,
                required DateTime likedAt,
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                id: id,
                imageUrl: imageUrl,
                breed: breed,
                description: description,
                temperament: temperament,
                origin: origin,
                lifeSpan: lifeSpan,
                wikipediaUrl: wikipediaUrl,
                likedAt: likedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCat,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
      LikedCat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
}
