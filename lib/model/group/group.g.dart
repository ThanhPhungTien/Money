// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createTime: (json['createTime'] as num?)?.toInt() ?? 0,
      updateTime: (json['updateTime'] as num?)?.toInt() ?? 0,
      mode: (json['mode'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'mode': instance.mode,
    };
