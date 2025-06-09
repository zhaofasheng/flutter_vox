// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userId = (json['user_id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..videoUrl = json['video_url'] as String?
  ..videoDownloadUrl = json['video_download_url'] as String?
  ..videoCoverUrl = json['video_cover_url'] as String?
  ..videoLen = (json['video_len'] as num?)?.toInt()
  ..introduce = json['introduce'] as String?
  ..screen = (json['screen'] as num?)?.toInt()
  ..thirdVid = json['third_vid'] as String?
  ..thirdVideoId = json['third_video_id'] as String?
  ..isTop = (json['is_top'] as num?)?.toInt()
  ..weight = (json['weight'] as num?)?.toInt()
  ..firstFrameUrl = json['first_frame_url'] as String?
  ..sellSeriesId = (json['sell_series_id'] as num?)?.toInt()
  ..compilationId = (json['compilation_id'] as num?)?.toInt()
  ..userInfo = json['user_info'] == null
      ? null
      : UserInfoModel.fromJson(json['user_info'] as Map<String, dynamic>);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'video_url': instance.videoUrl,
      'video_download_url': instance.videoDownloadUrl,
      'video_cover_url': instance.videoCoverUrl,
      'video_len': instance.videoLen,
      'introduce': instance.introduce,
      'screen': instance.screen,
      'third_vid': instance.thirdVid,
      'third_video_id': instance.thirdVideoId,
      'is_top': instance.isTop,
      'weight': instance.weight,
      'first_frame_url': instance.firstFrameUrl,
      'sell_series_id': instance.sellSeriesId,
      'compilation_id': instance.compilationId,
      'user_info': instance.userInfo,
    };
