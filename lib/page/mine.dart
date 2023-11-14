import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  var _number = Future(() => 0);
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _number,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data.toString());
                }
                return Icon(Icons.incomplete_circle);
              }),
          ElevatedButton(
              onPressed: () {
                _number = Future.delayed(
                    Duration(seconds: 2), () => Random().nextInt(10));
                setState(() {});
              },
              child: Text('点击')),
          ElevatedButton(
              onPressed: () {
                Future(() async {
                  final ImagePicker picker = ImagePicker();
                  return await picker.pickImage(source: ImageSource.gallery);
                }).then((value) {
                  image = value;
                  setState(() {});
                });
              },
              child: Text('点击')),
          image != null ? Image.file(File(image!.path)) : Icon(Icons.add),
        ],
      ),
    );
  }
}
