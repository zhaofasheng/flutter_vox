import 'package:json_annotation/json_annotation.dart';
import 'package:vox_video/app/modules/order_list_view/views/series_info_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(fromJson: _toString)
  String? id;

  @JsonKey(fromJson: _toString)
  String? sn;

  @JsonKey(fromJson: _toString)
  String? fee;

  String? gid;

  @JsonKey(name: 'pay_type', fromJson: _toString)
  String? payType;

  @JsonKey(name: 'pay_status', fromJson: _toString)
  String? payStatus;

  @JsonKey(name: 'pay_time', fromJson: _toString)
  String? payTime;

  @JsonKey(name: 'product_type', fromJson: _toString)
  String? productType;

  @JsonKey(fromJson: _toString)
  String? quantity;

  @JsonKey(name: 'series_info')
  SeriesInfoModel? seriesInfo;

  OrderModel();

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  static String? _toString(dynamic value) => value?.toString();
}