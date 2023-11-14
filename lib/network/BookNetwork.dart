import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:novel/bean/Book.dart';
import 'package:novel/utils/ShowUtil.dart';
import '../bean/Chapter.dart';

class BookNetwork {
  static Future<Document> _document(String url) async {
    final resonse = await http.get(Uri.parse(url));
    return parser.parse(resonse.body);
  }

  // https://www.qidian.com/free/all/
/*  static Future<List<Book>> _getBooks(String allUrl) async {
    final document = await _document(allUrl);
    final elements = document.querySelectorAll('#book-img-text > ul > li');
    final books = <Book>[];
    for (var element in elements) {
      final name = element.querySelector('div.book-mid-info > h2 > a')!.text;
      final info = element.querySelector('div.book-mid-info > p.intro')!.text;
      final image = element
          .querySelector('div.book-img-box > a > img')!
          .attributes['src']!;
      final url = element
          .querySelector('div.book-mid-info > h2 > a')!
          .attributes['href']!;
      final book = Book(
        name: name,
        info: info,
        imgUrl: 'https:${image}.webp',
        infoUrl: 'https:$url',
      );
      books.add(book);
    }
    return books;
  }*/

/*  static Future<List<Book>> _books() async {
    final books = <Book>[];
    for (var i = 1; i <= 5; i++) {
      final url = 'https://www.qidian.com/free/all/page$i/';
      final books2 = await _getBooks(url);
      books.addAll(books2);
    }
    return books;
  }*/

// https://www.qidian.com/chapter/1038188187/769273027/
  static Future<Chapter> chapter(String url) async {
    ShowUtil.myPrint('chapter: $url');
    final document = await _document(url);

    final name = document
        .querySelector(
            "#reader-content > div.min-h-100vh.relative.z-1.bg-inherit > div > div.relative > div > h1")!
        .text;
    final elements = document.querySelectorAll(
        "#reader-content > div.min-h-100vh.relative.z-1.bg-inherit > div > div.relative > div > main > p");

    final stringBuffer = StringBuffer();
    for (var element in elements) {
      stringBuffer.writeln(element.text);
    }
    final chapter = Chapter(
      name: name,
      content: stringBuffer.toString(),
      chapterUrl: url,
    );
    return chapter;
  }

//   final zhangjie = 'https://www.qidian.com/book/1038188187/';
  static Future<List<Chapter>> chapters(String url) async {
    ShowUtil.myPrint('chapters: $url');
    final document = await _document(url);
    final elements = document.querySelectorAll("#allCatalog > div > ul > li");
    final chapters = <Chapter>[];

    for (var element in elements) {
      final name = element.querySelector("a")!.text;
      final chapterUrl = element.querySelector("a")!.attributes['href']!;
      chapters.add(Chapter(
        name: name,
        chapterUrl: "https:$chapterUrl",
      ));
    }

    return chapters;
  }

  static _print(Object object) {
    print("haojinhui: $object");
  }

  static Future<List<Book>> books({String name = '斗罗大陆'}) async {
    final books = <Book>[];
    final url = 'https://www.qidian.com/so/$name.html?vip=0&page=1';
    ShowUtil.myPrint('books: $url');
    final document = await _document(url);
    final elements = document.querySelectorAll("#result-list > div > ul > li");

    for (var element in elements) {
      final name = element.querySelector("div.book-mid-info > h3 > a")!.text;
      final imgUrl = element
          .querySelector("div.book-img-box > a > img")!
          .attributes['src']!;
      final info =
          element.querySelector("div.book-mid-info > p.intro.m3")!.text;
      final infoUrl = element
          .querySelector("div.book-mid-info > h3 > a")!
          .attributes['href']!;

      final book = Book()
        ..name = name
        ..imgUrl = 'https:$imgUrl.webp'
        ..info = info
        ..infoUrl = 'https:$infoUrl';
      books.add(book);
    }
    return books;
  }
}
