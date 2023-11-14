import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novel/model/BookModel.dart';
import 'package:novel/model/ChapterModel.dart';
import 'package:novel/model/CollectModel.dart';
import 'package:novel/utils/ShowUtil.dart';
import '../bean/Book.dart';
import '../bean/Chapter.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({Key? key}) : super(key: key);

  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  late Book _book = Book();

  @override
  void initState() {
    super.initState();
    _book = Get.arguments['book'];
    // 加载章节
    ChapterModel.chapters(_book).then((value) {
      ShowUtil.myPrint('initState');
      setState(() {
        ShowUtil.myPrint('_book: $_book');
        _book = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _book.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(
                        _book.imgUrl,
                        height: 200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        _book.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 10),
                      Text(
                        _book.info,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true, // 固定高度
                physics: NeverScrollableScrollPhysics(), // 禁止滑动
                itemCount: _book.chapters.length,
                itemBuilder: (context, index) =>
                    ChapterItem(chapter: _book.chapters[index]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      CollectModel.insertBook(_book);
                      Get.snackbar("收藏", '');
                    },
                    child: Text('收藏'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('阅读'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChapterItem extends StatefulWidget {
  const ChapterItem({super.key, required this.chapter});

  final Chapter chapter;

  @override
  State<ChapterItem> createState() => _ChapterItemState();
}

class _ChapterItemState extends State<ChapterItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(widget.chapter.name),
      ),
      onTap: () {
        Get.toNamed('/ContentPage', arguments: {'chapter': widget.chapter});
      },
    );
  }
}
