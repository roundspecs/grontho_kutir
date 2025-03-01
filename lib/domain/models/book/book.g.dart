// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'title': instance.title,
      'author': instance.author,
      'category': instance.category,
    };
