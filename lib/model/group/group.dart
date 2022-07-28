import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable(explicitToJson: true)
class Group {
  final String id;
  final String name;
  final String description;
  final int createTime;
  final int updateTime;
  final int mode;

  const Group({
    this.id = '',
    this.name = '',
    this.description = '',
    this.createTime = 0,
    this.updateTime = 0,
    this.mode = -1,
  });

  factory Group.fromJson(json) => _$GroupFromJson(json);

  Map<String,dynamic> toJson() => _$GroupToJson(this);

  Group copyWith({
    String? id,
    String? name,
    String? description,
    int? createTime,
    int? updateTime,
    int? mode,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      mode: mode ?? this.mode,
    );
  }
}
