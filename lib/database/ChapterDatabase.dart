import 'package:flutter/cupertino.dart';
import 'package:novel/bean/Chapter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../bean/Dog.dart';

class ChapterDatabase {
  static const _table = 'chapter';

  /**
   * 没有内容的不应该保存
   */

  static Future<Database> _database() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'chapter_database.db'),
      onCreate: (db, version) => db.execute(
          'create table $_table(id integer primary key autoincrement, name text, content text, chapterUrl text)'),
      version: 3,
    );
  }

  static insertChapter(Chapter chapter) async {
    final db = await _database();

    db.insert(
      _table,
      chapter.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static insertChapters(List<Chapter> chapters) async {
    for (var chapter in chapters) {
      insertChapter(chapter);
    }
  }

  static Future<Chapter?> chapter(String url) async {
    final db = await _database();
    var maps =
        await db.query(_table, where: 'chapterUrl = ?', whereArgs: [url]);
    if (maps.isEmpty) {
      return null;
    }
    return Chapter.fromJson(maps.first);
  }

  static Future<List<Chapter>> chapters() async {
    final db = await _database();
    final maps = await db.query(_table);
    return List.generate(
      maps.length,
      (index) => Chapter.fromJson(maps[index]),
    );
  }

  static deleteChapters() async {
    final db = await _database();
    db.delete(_table);
  }
}
