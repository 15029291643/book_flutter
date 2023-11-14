import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../bean/Dog.dart';

class DogDatabase {
  static const _table = 'dogs';

  static Future<Database> _database() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) => db.execute(
          'create table dogs(id integer primary key, name text, age integer)'),
      version: 1,
    );
  }

  static insertDog(Dog dog) async {
    final db = await _database();
    db.insert(
      _table,
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Dog>> dogs() async {
    final db = await _database();
    final maps = await db.query(_table);
    return List.generate(
      maps.length,
      (index) => Dog.fromMap(maps[index]),
    );
  }
}
