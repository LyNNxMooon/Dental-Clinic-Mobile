import 'package:json_annotation/json_annotation.dart';
part 'user_vo.g.dart';

@JsonSerializable()
class UserVO {
  final String id;
  final String name;
  @JsonKey(name: "is_banned")
  final bool isBanned;
  final String url;
  final int age;
  final String gender;

  UserVO(
      {required this.id,
      required this.name,
      required this.isBanned,
      required this.url,
      required this.age,
      required this.gender});

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);
}
