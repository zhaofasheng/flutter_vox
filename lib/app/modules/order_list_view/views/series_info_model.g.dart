// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesInfoModel _$SeriesInfoModelFromJson(Map<String, dynamic> json) =>
    SeriesInfoModel()
      ..id = SeriesInfoModel._toString(json['id'])
      ..seriesName = json['series_name'] as String?
      ..coverUrl = json['cover_url'] as String?
      ..simpleCoverUrl = json['simple_cover_url'] as String?
      ..introduceImgUrl = json['introduce_img_url'] as String?
      ..carouselImages = (json['carousel_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..originalPrice = SeriesInfoModel._toString(json['original_price'])
      ..price = SeriesInfoModel._toString(json['price'])
      ..episodes = SeriesInfoModel._toString(json['episodes'])
      ..publishedEpisodes =
          SeriesInfoModel._toString(json['published_episodes'])
      ..createdAt = SeriesInfoModel._toString(json['created_at'])
      ..productId = json['product_id'] as String?
      ..shareImgUrl = json['share_img_url'] as String?
      ..openUpfrontActivity =
          SeriesInfoModel._toString(json['open_upfront_activity'])
      ..upfrontPrice = SeriesInfoModel._toString(json['upfront_price'])
      ..upfrontAt = SeriesInfoModel._toString(json['upfront_at'])
      ..openEpisodeWay = SeriesInfoModel._toString(json['open_episode_way'])
      ..episodePrice = SeriesInfoModel._toString(json['episode_price'])
      ..supportRefund = SeriesInfoModel._toString(json['support_refund'])
      ..isBought = SeriesInfoModel._toString(json['is_bought'])
      ..buyCardTimes = SeriesInfoModel._toString(json['buy_card_times']);

Map<String, dynamic> _$SeriesInfoModelToJson(SeriesInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'series_name': instance.seriesName,
      'cover_url': instance.coverUrl,
      'simple_cover_url': instance.simpleCoverUrl,
      'introduce_img_url': instance.introduceImgUrl,
      'carousel_images': instance.carouselImages,
      'original_price': instance.originalPrice,
      'price': instance.price,
      'episodes': instance.episodes,
      'published_episodes': instance.publishedEpisodes,
      'created_at': instance.createdAt,
      'product_id': instance.productId,
      'share_img_url': instance.shareImgUrl,
      'open_upfront_activity': instance.openUpfrontActivity,
      'upfront_price': instance.upfrontPrice,
      'upfront_at': instance.upfrontAt,
      'open_episode_way': instance.openEpisodeWay,
      'episode_price': instance.episodePrice,
      'support_refund': instance.supportRefund,
      'is_bought': instance.isBought,
      'buy_card_times': instance.buyCardTimes,
    };
