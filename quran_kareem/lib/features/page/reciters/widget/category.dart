import 'package:flutter/material.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_kareem/features/page/reciters/screens/details_page.dart'; 

class Category extends StatelessWidget {
  final int index;
  final String reciterName;
  final int surahTotal;
  final Map<String, dynamic> moshaf;
  final Map<int, List<String>> audioLinksMap; // ✅ تمرير البيانات كمطلوبة

  const Category({
    super.key,
    required this.index,
    required this.reciterName,
    required this.surahTotal,
    required this.moshaf,
    required this.audioLinksMap, // ✅ إضافتها هنا
  });

  @override
  Widget build(BuildContext context) {
    int targetMoshafId = moshaf["moshaf_id"]; // ✅ استخراج `moshaf_id`

    return InkWell(
      onTap: () {
        context.go('/detailsPage', extra: {
          "moshaf": moshaf,
          "audioList": audioLinksMap[targetMoshafId] ?? [], // ✅ تمرير البيانات بشكل آمن
        });

        print("to detailspage ${moshaf["moshaf_name"]}");
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  Assets.imagesStar,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  "${index + 1}",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primarycolor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reciterName,
                style: TextStyle(fontSize: 15, color: AppColors.primarycolor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 3),
              Text(
                "Surah Total: $surahTotal",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
