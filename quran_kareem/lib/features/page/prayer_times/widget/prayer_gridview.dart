import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';

class PrayersGrid extends StatelessWidget {
  final Map<String, String> timings;

  const PrayersGrid({Key? key, required this.timings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true, 
          physics: const NeverScrollableScrollPhysics(), 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: timings.length,
          itemBuilder: (context, index) {
            String key = timings.keys.elementAt(index);
            String value = timings[key] ?? '';
            return buildContainer(key, value);
          },
        ),
      ),
    );

  }

  Widget buildContainer(String title, String time) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black54,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesStar,
            width: 140,
            height: 130,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title, 
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    time, 
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
