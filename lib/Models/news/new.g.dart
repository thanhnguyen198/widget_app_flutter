// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

New _$NewFromJson(Map<String, dynamic> json) => New(
      endAt: json['endAt'] as String,
      content: json['content'] as String,
      startAt: json['startAt'] as String,
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      title: json['title'] as String,
      categoryName: json['categoryName'] as String,
      displayNewPeriod: json['displayNewPeriod'] as String,
    );

Map<String, dynamic> _$NewToJson(New instance) => <String, dynamic>{
      'endAt': instance.endAt,
      'content': instance.content,
      'startAt': instance.startAt,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'title': instance.title,
      'categoryName': instance.categoryName,
      'displayNewPeriod': instance.displayNewPeriod,
    };
