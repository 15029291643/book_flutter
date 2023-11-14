import 'package:novel/database/BookDatabase.dart';
import 'package:novel/network/BookNetwork.dart';

import '../bean/Book.dart';

class BookModel {
/*  static Future<List<Book>> _books() async {
    var books = await BookDatabase.books();
    if (books.isNotEmpty) {
      return books;
    }
    books = await BookNetwork.books();
    await BookDatabase.insertBooks(books);
    // 需要返回值带 id，所以从 splite 返回
    return await BookDatabase.books();
  }*/

  static deleteBooks() async {
    await BookDatabase.deleteBooks();
  }

  static Future<List<Book>> books(String name) async {
    return await BookNetwork.books(name: name);
  }
}
