// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesVideoModel _$SeriesVideoModelFromJson(Map<String, dynamic> json) =>
    SeriesVideoModel()
      ..id = SeriesVideoModel._toString(json['id'])
      ..title = json['title'] as String?;

Map<String, dynamic> _$SeriesVideoModelToJson(SeriesVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
