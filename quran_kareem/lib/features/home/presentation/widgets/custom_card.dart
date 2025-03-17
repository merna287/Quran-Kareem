import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';

class CustomCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String value;
  final String path;

  const CustomCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.value,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        SvgPicture.asset(Assets.imagesCardHome,
            width: 150, height: 140, fit: BoxFit.fill),
        Positioned.fill(
          top: -50,
          left: 10,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    //backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    //backgroundColor: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 5,
          child: InkWell(
            onTap: () {
              print("onTap $value");
              customNavigate(context, path);
            },
            child: SvgPicture.asset(Assets.imagesNavigation,
                width: 40, height: 40),
          ),
        ),
      ],
    );
  }
}
