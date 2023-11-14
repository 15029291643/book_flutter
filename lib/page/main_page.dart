import 'package:flutter/material.dart';
import 'package:novel/page/HistoryPage.dart';
import 'package:novel/page/mine.dart';
import 'package:novel/page/my_home.dart';
import 'package:novel/utils/ShowUtil.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    HistoryPage(),
    Mine(),
    MyHome(),
  ];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小说')),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          _index = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: "收藏",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "历史",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "我的",
          ),
        ],
      ),
    );
  }
}
