// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createTime: json['createTime'] as int? ?? 0,
      updateTime: json['updateTime'] as int? ?? 0,
      mode: json['mode'] as int? ?? -1,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'mode': instance.mode,
    };
