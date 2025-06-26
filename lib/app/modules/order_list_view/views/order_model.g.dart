// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel()
  ..id = OrderModel._toString(json['id'])
  ..sn = OrderModel._toString(json['sn'])
  ..fee = OrderModel._toString(json['fee'])
  ..gid = json['gid'] as String?
  ..payType = OrderModel._toString(json['pay_type'])
  ..payStatus = OrderModel._toString(json['pay_status'])
  ..payTime = OrderModel._toString(json['pay_time'])
  ..productType = OrderModel._toString(json['product_type'])
  ..quantity = OrderModel._toString(json['quantity'])
  ..seriesInfo = json['series_info'] == null
      ? null
      : SeriesInfoModel.fromJson(json['series_info'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sn': instance.sn,
      'fee': instance.fee,
      'gid': instance.gid,
      'pay_type': instance.payType,
      'pay_status': instance.payStatus,
      'pay_time': instance.payTime,
      'product_type': instance.productType,
      'quantity': instance.quantity,
      'series_info': instance.seriesInfo,
    };
