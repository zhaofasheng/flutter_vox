import 'package:flutter/cupertino.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:vox_video/app/modules/Untils/app_text.dart';
import 'package:vox_video/app/modules/order_list_view/views/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order, this.onTap});
  final OrderModel order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: HexColor('#FFFFFF'),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('订单编号：${order.sn}', fontSize: 12,color: HexColor('#8A8F99'),),
              AppText(order.payStatus == '2' ? '交易成功':'交易失败',
                color:order.payStatus == '2' ? HexColor('#14151A'):HexColor('#8A8F99'),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      order.seriesInfo?.simpleCoverUrl ?? '',
                      fit: BoxFit.cover,
                      width: 56,
                      height: 74,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        order.seriesInfo?.seriesName ?? '',
                        fontSize: 16,
                        color: HexColor('#14151A'),
                        maxLines: 1,
                      ),
                      Text(
                        order.productType == '3' ? '礼品卡':'共${order.seriesInfo?.episodes}课时',
                        style: TextStyle(
                            fontSize: 12,
                            color: HexColor('#8A8F99')
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child:Text(
                  '￥${((int.tryParse(order.fee ?? '0') ?? 0) / 100).toStringAsFixed(0)}',
                    style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#14151A')
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
