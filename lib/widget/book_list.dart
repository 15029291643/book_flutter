import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../bean/Book.dart';

class BookList extends StatefulWidget {
  BookList({super.key, required this.books});

  var books = <Book>[];

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (context, index) => BookItem(book: widget.books[index]),
      ),
    );
  }
}

class BookItem extends StatefulWidget {
  const BookItem({super.key, required this.book});

  final Book book;

  @override
  State<BookItem> createState() => _BookState();
}

class _BookState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Image.network(
          widget.book.imgUrl,
          fit: BoxFit.cover,
        ),
        title: Text(widget.book.name),
        subtitle: Text(
          widget.book.info,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        Get.toNamed("/BookInfo", arguments: {"book": widget.book});
      },
    );
  }
}
