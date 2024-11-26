// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVO _$UserVOFromJson(Map<String, dynamic> json) => UserVO(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: (json['phone'] as num).toInt(),
      address: json['address'] as String,
      allergicMedicine: json['allergic_medicine'] as String,
      isBanned: json['is_banned'] as bool,
      url: json['url'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      banReason: json['ban_reason'] as String,
    );

Map<String, dynamic> _$UserVOToJson(UserVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'allergic_medicine': instance.allergicMedicine,
      'is_banned': instance.isBanned,
      'url': instance.url,
      'age': instance.age,
      'gender': instance.gender,
      'ban_reason': instance.banReason,
    };
