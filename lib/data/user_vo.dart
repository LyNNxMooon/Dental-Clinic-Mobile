import 'package:json_annotation/json_annotation.dart';
part 'user_vo.g.dart';

@JsonSerializable()
class UserVO {
  final String id;
  final String name;
  final int phone;
  final String address;
  @JsonKey(name: 'allergic_medicine')
  final String allergicMedicine;
  @JsonKey(name: "is_banned")
  final bool isBanned;
  final String url;
  final int age;
  final String gender;
  @JsonKey(name: "ban_reason")
  final String banReason;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  UserVO(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.allergicMedicine,
      required this.isBanned,
      required this.url,
      required this.age,
      required this.gender,
      required this.banReason,
      required this.fcmToken});

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);
}
