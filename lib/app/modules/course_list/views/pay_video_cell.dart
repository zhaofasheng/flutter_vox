import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vox_video/app/modules/course_list/views/series_detail_model.dart';

import '../../../routes/app_pages.dart';


class PayVideoCell extends StatelessWidget {
  final SeriesDetailModel model;

  const PayVideoCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final titles = model.videos?.map((e) => e.title ?? '').take(4).toList() ?? [];
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.SERIES_DETAIL_VIEW,arguments: model);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              // 封面图
              Image.network(
                model.coverUrl ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: (232 / 355) * (MediaQuery.of(context).size.width - 20),
              ),
              // 视频标题、课时、报名人数
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width - 20)*139/355,right: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      ...titles.map((title) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF14151A),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '共${model.episodes ?? '0'}课时',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8A8F99),
                            ),
                          ),
                          Text(
                            '${model.buyUsersNum ?? '0'}人已报名',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF5C5F66),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}