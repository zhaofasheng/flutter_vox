import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  int? id;

  @JsonKey(name: 'nick_name')
  String? nickName;

  int? level;

  @JsonKey(name: 'frequency_no', fromJson: _toString)
  String? frequencyNo;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  @JsonKey(name: 'user_id', fromJson: _toString)
  String? userId;

  String? token;

  UserInfoModel();

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  /// 用于 fromJson 的通用 string 转换器
  static String? _toString(dynamic value) => value?.toString();
}