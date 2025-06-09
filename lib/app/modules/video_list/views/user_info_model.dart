import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';



@JsonSerializable()
class UserInfoModel {
  int? id;

  @JsonKey(name: 'nick_name')
  String? nickName;

  int? level;

  @JsonKey(name: 'frequency_no')
  String? frequencyNo;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  UserInfoModel();

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}