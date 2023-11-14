import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novel/bean/Book.dart';
import 'package:novel/database/CollectDatabase.dart';
import 'package:novel/utils/ShowUtil.dart';
import 'package:novel/widget/book_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // var _books = <Book>[].obs;

  var _books = <Book>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShowUtil.myPrint("init");
    CollectDatabase.books().then((value) {
      print('value.length${value.length}');
      _books = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookList(books: _books),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CollectDatabase.books().then((value) {
            _books = value;
            ShowUtil.myPrint(value);
            setState(() {});
          });
          Get.snackbar("刷新", '');
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
