import 'package:json_annotation/json_annotation.dart';
import 'package:vox_video/app/modules/course_list/views/series_video_model.dart';

part 'series_detail_model.g.dart';

@JsonSerializable()
class SeriesDetailModel {
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

  @JsonKey(name: 'is_bought', fromJson: _toString)
  String? isBought;

  @JsonKey(name: 'buy_card_times', fromJson: _toString)
  String? buyCardTimes;

  @JsonKey(name: 'support_refund', fromJson: _toString)
  String? supportRefund;

  @JsonKey(name: 'pay_tip')
  String? payTip;

  List<SeriesVideoModel>? videos;

  @JsonKey(name: 'buy_users_num', fromJson: _toString)
  String? buyUsersNum;

  @JsonKey(name: 'commentCt', fromJson: _toString)
  String? commentCount;

  String? qqShareUrl;
  String? wechatShareUrl;
  String? friendShareUrl;
  String? appletId;
  String? appletPage;

  SeriesDetailModel();

  factory SeriesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailModelToJson(this);

  static String? _toString(dynamic value) => value?.toString();
}