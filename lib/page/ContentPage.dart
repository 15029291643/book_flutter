import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novel/model/ChapterModel.dart';
import '../bean/Chapter.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late Chapter _chapter;

  @override
  void initState() {
    super.initState();
    _chapter = Get.arguments['chapter'];
    ChapterModel.chapter(_chapter.chapterUrl).then((value) {
      setState(() {
        _chapter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text(_chapter.name),
            subtitle: Text(_chapter.content),
          ),
        ],
      ),
    );
  }
}
