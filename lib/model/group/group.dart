import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';

part 'group.g.dart';


@freezed
class Group with _$Group {
  const factory Group({
    @Default('') String id ,
    @Default('') String name ,
    @Default('') String description ,
    @Default(0) int createTime,
    @Default(0) int updateTime,
    @Default(-1) int mode ,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
