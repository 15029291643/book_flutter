import 'package:flutter/cupertino.dart';
import 'package:novel/bean/Book.dart';
import 'package:novel/utils/ShowUtil.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../bean/Dog.dart';

class BookDatabase {
  static const _table = 'books';

/*
  var name = '';
  var info = '';
  var imgUrl = '';
  var infoUrl = '';
  var chapters = <Chapter>[];

 */

  static Future<Database> _database() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'book_database.db'),
      onCreate: (db, version) => db.execute(
          'create table $_table(id integer primary key autoincrement, name text, info text, imgUrl text, infoUrl text, chapters text)'),
      version: 5,
    );
  }

  static insertBook(Book book) async {
    final db = await _database();
    ShowUtil.myPrint('insert into');
    ShowUtil.myPrint('book: $book');
    final result = await db.insert(
      _table,
      book.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    ShowUtil.myPrint('result: $result');
  }

  static insertBooks(List<Book> books) async {
    // ShowUtil.myPrint("insertBooks");
    // ShowUtil.myPrint("length: ${books.length}");
    for (var book in books) {
      insertBook(book);
    }
  }

  static Future<List<Book>> books() async {
    final db = await _database();
    final maps = await db.query(_table);
    ShowUtil.myPrint("books");
    ShowUtil.myPrint('length: ${maps.length}');
    return List.generate(
      maps.length,
      (index) => Book.fromJson(maps[index]),
    );
  }

  static deleteBooks() async {
    final db = await _database();
    db.delete(_table);
  }
}
