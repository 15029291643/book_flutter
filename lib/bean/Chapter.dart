import 'dart:convert';

import 'package:novel/utils/ShowUtil.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Chapter.g.dart';

@JsonSerializable()
class Chapter {
  int? id;
  var name = '';
  var content = '';

  var chapterUrl = '';

  Chapter({this.name = '', this.content = '', this.chapterUrl = ''});

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);

  @override
  String toString() {
    return 'Chapter{id: $id, name: $name, content: ${content.length < 20 ? "null" : content.substring(0, 20)}, chapterUrl: $chapterUrl}';
  }
}
