// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetailModel _$SeriesDetailModelFromJson(Map<String, dynamic> json) =>
    SeriesDetailModel()
      ..id = SeriesDetailModel._toString(json['id'])
      ..seriesName = json['series_name'] as String?
      ..coverUrl = json['cover_url'] as String?
      ..simpleCoverUrl = json['simple_cover_url'] as String?
      ..introduceImgUrl = json['introduce_img_url'] as String?
      ..carouselImages = (json['carousel_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..originalPrice = SeriesDetailModel._toString(json['original_price'])
      ..price = SeriesDetailModel._toString(json['price'])
      ..episodes = SeriesDetailModel._toString(json['episodes'])
      ..publishedEpisodes =
          SeriesDetailModel._toString(json['published_episodes'])
      ..createdAt = SeriesDetailModel._toString(json['created_at'])
      ..productId = json['product_id'] as String?
      ..shareImgUrl = json['share_img_url'] as String?
      ..openUpfrontActivity =
          SeriesDetailModel._toString(json['open_upfront_activity'])
      ..upfrontPrice = SeriesDetailModel._toString(json['upfront_price'])
      ..upfrontAt = SeriesDetailModel._toString(json['upfront_at'])
      ..openEpisodeWay = SeriesDetailModel._toString(json['open_episode_way'])
      ..episodePrice = SeriesDetailModel._toString(json['episode_price'])
      ..isBought = SeriesDetailModel._toString(json['is_bought'])
      ..buyCardTimes = SeriesDetailModel._toString(json['buy_card_times'])
      ..supportRefund = SeriesDetailModel._toString(json['support_refund'])
      ..payTip = json['pay_tip'] as String?
      ..videos = (json['videos'] as List<dynamic>?)
          ?.map((e) => SeriesVideoModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..buyUsersNum = SeriesDetailModel._toString(json['buy_users_num'])
      ..commentCount = SeriesDetailModel._toString(json['commentCt'])
      ..qqShareUrl = json['qqShareUrl'] as String?
      ..wechatShareUrl = json['wechatShareUrl'] as String?
      ..friendShareUrl = json['friendShareUrl'] as String?
      ..appletId = json['appletId'] as String?
      ..appletPage = json['appletPage'] as String?;

Map<String, dynamic> _$SeriesDetailModelToJson(SeriesDetailModel instance) =>
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
      'is_bought': instance.isBought,
      'buy_card_times': instance.buyCardTimes,
      'support_refund': instance.supportRefund,
      'pay_tip': instance.payTip,
      'videos': instance.videos,
      'buy_users_num': instance.buyUsersNum,
      'commentCt': instance.commentCount,
      'qqShareUrl': instance.qqShareUrl,
      'wechatShareUrl': instance.wechatShareUrl,
      'friendShareUrl': instance.friendShareUrl,
      'appletId': instance.appletId,
      'appletPage': instance.appletPage,
    };
