import 'package:json_annotation/json_annotation.dart';

part 'series_info_model.g.dart';

@JsonSerializable()
class SeriesInfoModel {
  @JsonKey(fromJson: _toString)
  String? id;

  @JsonKey(name: 'series_name')
  String? seriesName;

  @JsonKey(name: 'cover_url')
  String? coverUrl;

  @JsonKey(name: 'simple_cover_url')
  String? simpleCoverUrl;

  @JsonKey(name: 'introduce_img_url')
  String? introduceImgUrl;

  @JsonKey(name: 'carousel_images')
  List<String>? carouselImages;

  @JsonKey(name: 'original_price', fromJson: _toString)
  String? originalPrice;

  @JsonKey(fromJson: _toString)
  String? price;

  @JsonKey(fromJson: _toString)
  String? episodes;

  @JsonKey(name: 'published_episodes', fromJson: _toString)
  String? publishedEpisodes;

  @JsonKey(name: 'created_at', fromJson: _toString)
  String? createdAt;

  @JsonKey(name: 'product_id')
  String? productId;

  @JsonKey(name: 'share_img_url')
  String? shareImgUrl;

  @JsonKey(name: 'open_upfront_activity', fromJson: _toString)
  String? openUpfrontActivity;

  @JsonKey(name: 'upfront_price', fromJson: _toString)
  String? upfrontPrice;

  @JsonKey(name: 'upfront_at', fromJson: _toString)
  String? upfrontAt;

  @JsonKey(name: 'open_episode_way', fromJson: _toString)
  String? openEpisodeWay;

  @JsonKey(name: 'episode_price', fromJson: _toString)
  String? episodePrice;

  @JsonKey(name: 'support_refund', fromJson: _toString)
  String? supportRefund;

  @JsonKey(name: 'is_bought', fromJson: _toString)
  String? isBought;

  @JsonKey(name: 'buy_card_times', fromJson: _toString)
  String? buyCardTimes;

  SeriesInfoModel();

  factory SeriesInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesInfoModelToJson(this);

  static String? _toString(dynamic value) => value?.toString();
}