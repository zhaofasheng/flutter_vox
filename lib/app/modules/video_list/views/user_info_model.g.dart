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
      ..frequencyNo = UserInfoModel._toString(json['frequency_no'])
      ..avatarUrl = json['avatar_url'] as String?
      ..userId = UserInfoModel._toString(json['user_id'])
      ..token = json['token'] as String?;

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'level': instance.level,
      'frequency_no': instance.frequencyNo,
      'avatar_url': instance.avatarUrl,
      'user_id': instance.userId,
      'token': instance.token,
    };
