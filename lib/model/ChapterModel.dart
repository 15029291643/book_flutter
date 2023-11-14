import 'package:novel/bean/Chapter.dart';
import 'package:novel/database/ChapterDatabase.dart';
import 'package:novel/network/BookNetwork.dart';
import 'package:novel/utils/ShowUtil.dart';

import '../bean/Book.dart';
import '../database/BookDatabase.dart';

class ChapterModel {
  static Future<Chapter> chapter(String url) async {
    // 本地查找
    var chapter = await ChapterDatabase.chapter(url);
    if (chapter != null) {
      return chapter;
    }
    // 网络请求
    chapter = await BookNetwork.chapter(url);
    await ChapterDatabase.insertChapter(chapter);
    return chapter;
  }


//目录
  static Future<Book> chapters(Book book) async {
    if (book.chapters.isNotEmpty) {
      return book;
    }
    book.chapters = await BookNetwork.chapters(book.infoUrl);
    // ShowUtil.myPrint('network: ${book.chapters.length}');
    // await BookDatabase.insertBook(book);
    return book;
  }
}
