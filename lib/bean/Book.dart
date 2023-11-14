import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'Chapter.dart';
part 'Book.g.dart';

@JsonSerializable()
class Book {
  int? id;
  var name = '';
  var info = '';
  var imgUrl = '';
  var infoUrl = '';
  var chapters = <Chapter>[];

  Book({
    this.name = '',
    this.info = '',
    this.imgUrl = '',
    this.infoUrl = '',
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  String toString() {
    return 'Book{id: $id, name: $name, info: $info, imgUrl: $imgUrl, infoUrl: $infoUrl, chapters: $chapters}';
  }
}
