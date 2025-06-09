import 'package:json_annotation/json_annotation.dart';
import 'user_info_model.dart';

part 'video_model.g.dart';


/// 视频数据模型
@JsonSerializable()
class VideoModel {
  /// 视频 ID
  int? id;

  /// 用户 ID
  @JsonKey(name: 'user_id')
  int? userId;

  /// 视频标题
  String? title;

  /// 视频播放链接
  @JsonKey(name: 'video_url')
  String? videoUrl;

  /// 视频下载链接
  @JsonKey(name: 'video_download_url')
  String? videoDownloadUrl;

  /// 视频封面图
  @JsonKey(name: 'video_cover_url')
  String? videoCoverUrl;

  /// 视频时长（单位：秒）
  @JsonKey(name: 'video_len')
  int? videoLen;

  /// 视频简介
  String? introduce;

  /// 视频方向（1: 横屏，2: 竖屏）
  int? screen;

  /// 第三方视频 VID
  @JsonKey(name: 'third_vid')
  String? thirdVid;

  /// 第三方视频 ID
  @JsonKey(name: 'third_video_id')
  String? thirdVideoId;

  /// 是否置顶
  @JsonKey(name: 'is_top')
  int? isTop;

  /// 视频权重
  int? weight;

  /// 第一帧封面图
  @JsonKey(name: 'first_frame_url')
  String? firstFrameUrl;

  /// 所属系列 ID
  @JsonKey(name: 'sell_series_id')
  int? sellSeriesId;

  /// 所属合集 ID
  @JsonKey(name: 'compilation_id')
  int? compilationId;

  /// 用户信息
  @JsonKey(name: 'user_info')
  UserInfoModel? userInfo;

  VideoModel();

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}