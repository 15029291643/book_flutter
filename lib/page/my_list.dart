import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novel/utils/ShowUtil.dart';

import '../bean/Book.dart';
import '../model/BookModel.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var _books = <Book>[];
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BookModel.books('斗罗大陆').then((value) {
      _books = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(hintText: '斗罗大陆'),
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: InkWell(
              child: ElevatedButton(
                child: Text('搜索'),
                onPressed: () {
                  final name = _controller.text.isBlank == true
                      ? '斗罗大陆'
                      : _controller.text;
                  BookModel.books(name).then((value) {
                    _books = value;
                    setState(() {});
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) => BookItem(book: _books[index]),
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
