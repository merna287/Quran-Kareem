import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranReciters extends StatefulWidget {
  const QuranReciters({super.key});

  @override
  State<QuranReciters> createState() => _QuranRecitersState();
}

class _QuranRecitersState extends State<QuranReciters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),  
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      customNavigate(context, "/homePage");
                    },
                    icon: Icon(Icons.arrow_back , color: AppColors.white,),
                  ), 
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(Assets.imagesImageprofile),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  width: 295,
                  height: 140,
                  child: SvgPicture.asset(
                    Assets.imagesLogoHome,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(Assets.imagesImageHomepng,
                        fit: BoxFit.fill),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Text(
                      "text over image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

