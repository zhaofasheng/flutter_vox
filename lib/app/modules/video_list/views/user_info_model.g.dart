// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel()
      ..id = (json['id'] as num?)?.toInt()
      ..nickName = json['nick_name'] as String?
      ..level = (json['level'] as num?)?.toInt()
      ..frequencyNo = json['frequency_no'] as String?
      ..avatarUrl = json['avatar_url'] as String?;

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'level': instance.level,
      'frequency_no': instance.frequencyNo,
      'avatar_url': instance.avatarUrl,
    };
