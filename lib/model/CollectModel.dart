import 'package:novel/database/CollectDatabase.dart';

import '../bean/Book.dart';

class CollectModel {
  static insertBook(Book book) async {
    await CollectDatabase.insertBook(book);
  }

  static Future<List<Book>> books() async {
    return await CollectDatabase.books();
  }
}
