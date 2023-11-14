import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:novel/bean/Dog.dart';
import 'package:novel/database/BookDatabase.dart';
import 'package:novel/database/ChapterDatabase.dart';
import 'package:novel/model/BookModel.dart';
import 'package:novel/model/ChapterModel.dart';
import 'package:novel/utils/ShowUtil.dart';

import '../bean/Book.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed("MyList");
              },
              child: Text('书籍列表')),
          ElevatedButton(
              onPressed: () {
                const dog = Dog(id: 1, name: "xiaogou", age: 12);
              },
              child: Text('添加小狗')),
          ElevatedButton(
              onPressed: () {
                BookDatabase.books().then((value) {
                  Get.snackbar(
                      '小说列表',
                      value.map((e) {
                        // 只作为标识
                        return '${e.id}: ${e.name.substring(0, 1)}';
                      }).toString());
                });
              },
              child: Text('小说列表')),
          ElevatedButton(
              onPressed: () {
                Get.snackbar("清空所有", "");
                BookDatabase.deleteBooks();
              },
              child: Text('清空小说')),
          ElevatedButton(
              onPressed: () {
                ChapterDatabase.chapters().then((value) {
                  for (var chapter in value) {
                    ShowUtil.myPrint(chapter);
                  }
                });
              },
              child: Text('chapters')),
          ElevatedButton(
              onPressed: () {
                ChapterDatabase.deleteChapters();
                ShowUtil.myPrint('deleteChapters');
              },
              child: Text('deleteChapters')),
          ElevatedButton(
              onPressed: () {
                Get.snackbar('输入内容', _controller.text);
              },
              child: Text('输入内容')),
          TextField(
            controller: _controller,
          ),
          Text('输入内容：${_controller.text}'),
          ElevatedButton(
              onPressed: () {


              },
              child: Text('输入内容')),

        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
