import 'package:flutter/cupertino.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:vox_video/app/modules/Untils/app_text.dart';
import 'package:vox_video/app/modules/course_list/views/series_detail_model.dart';

class SeriesHeaderView extends StatelessWidget {
  const SeriesHeaderView({super.key, required this.seriesDetailModel});

  final SeriesDetailModel seriesDetailModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: HexColor('#FFFFFF'),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(seriesDetailModel.seriesName ?? '', fontSize: 20,color: HexColor('#14151A'),),
              AppText(
                '共${seriesDetailModel.episodes}课时  |  已更新${seriesDetailModel.publishedEpisodes}课时',
                fontSize: 12,
                color: HexColor('#8A8F99'),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '4.6',
                          style: TextStyle(
                            fontSize: 18,
                            color: HexColor('#14151A'),
                          ),
                        ),
                        TextSpan(
                          text: '超满意',
                          style: TextStyle(
                            fontSize: 14,
                            color: HexColor('#14151A'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  AppText('学员评价', fontSize: 14,color: HexColor('#14151A'),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
