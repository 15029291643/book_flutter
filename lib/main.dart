import 'package:flutter/material.dart';
import 'package:novel/page/ContentPage.dart';
import 'package:novel/page/book_info.dart';
import 'package:novel/page/main_page.dart';
import 'package:novel/page/my_home.dart';
import 'package:get/get.dart';
import 'package:novel/page/my_list.dart';

main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: _pages,
    initialRoute: "/",
  ));
}

final _pages = [
  GetPage(name: '/MyHome', page: () => MyHome()),
  GetPage(name: "/MyList", page: () => MyList()),
  GetPage(name: "/BookInfo", page: () => BookInfo()),
  GetPage(name: "/ContentPage", page: () => ContentPage()),
  GetPage(name: "/", page: () => MainPage()),
];
