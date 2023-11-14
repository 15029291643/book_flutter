// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      name: json['name'] as String? ?? '',
      info: json['info'] as String? ?? '',
      imgUrl: json['imgUrl'] as String? ?? '',
      infoUrl: json['infoUrl'] as String? ?? '',
    )
      ..id = json['id'] as int?
      ..chapters = (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'imgUrl': instance.imgUrl,
      'infoUrl': instance.infoUrl,
      'chapters': instance.chapters,
    };
