import 'package:flutter/cupertino.dart';
import 'package:novel/bean/Book.dart';
import 'package:novel/utils/ShowUtil.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bean/Dog.dart';

class CollectDatabase {
  static const _table = 'CollectDatabase';

  static Future<Database> _database() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), '$_table.db'),
      onCreate: (db, version) => db.execute(
          'create table $_table(id integer primary key autoincrement, name text, info text, imgUrl text, infoUrl text, chapters text)'),
      version: 5,
    );
  }

  static insertBook(Book book) async {
    ShowUtil.myPrint('insertBook: $book');
    final db = await _database();
    await db.insert(
      _table,
      book.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // static insertBooks(List<Book> books) async {
  //   for (var book in books) {
  //     insertBook(book);
  //   }
  // }

  static Future<List<Book>> books() async {
    final db = await _database();
    final maps = await db.query(_table);
    ShowUtil.myPrint('books: ${maps.length}');
    return List.generate(
      maps.length,
      (index) => Book.fromJson(maps[index]),
    );
  }

/*  static deleteBooks() async {
    final db = await _database();
    db.delete(_table);
  }*/
}
