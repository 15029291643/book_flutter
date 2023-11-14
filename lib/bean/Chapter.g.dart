// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      name: json['name'] as String? ?? '',
      content: json['content'] as String? ?? '',
      chapterUrl: json['chapterUrl'] as String? ?? '',
    )..id = json['id'] as int?;

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'chapterUrl': instance.chapterUrl,
    };
