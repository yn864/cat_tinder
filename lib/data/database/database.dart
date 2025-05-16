import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';

part 'database.g.dart';

class LikedCats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breed => text()();
  TextColumn get description => text()();
  TextColumn get temperament => text()();
  TextColumn get origin => text()();
  TextColumn get lifeSpan => text()();
  TextColumn get wikipediaUrl => text()();
  DateTimeColumn get likedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LikedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> addLikedCat(LikedCatsCompanion cat) async {
    await into(likedCats).insert(cat);
  }

  Future<void> deleteLikedCat(String id) async {
    await (delete(likedCats)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<LikedCat>> getAllLikedCats() async {
    return select(likedCats).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await path_provider.getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cats.sqlite'));
    return NativeDatabase(file);
  });
}
