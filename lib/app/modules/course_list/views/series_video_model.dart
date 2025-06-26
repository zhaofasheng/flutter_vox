import 'package:json_annotation/json_annotation.dart';

part 'series_video_model.g.dart';

@JsonSerializable()
class SeriesVideoModel {
  @JsonKey(fromJson: _toString)
  String? id;

  String? title;

  SeriesVideoModel();

  factory SeriesVideoModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesVideoModelToJson(this);

  static String? _toString(dynamic value) => value?.toString();
}