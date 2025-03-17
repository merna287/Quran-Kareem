import 'package:flutter/material.dart';

import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_kareem/features/home/presentation/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        customNavigate(context, "/hamBurgerMenu");
                      });
                    },
                    child: SvgPicture.asset(Assets.imagesVector),
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
              Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("TO dO List");
                      customNavigate(context, "/todoPage");
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo[400]!,
                            blurRadius: 50,
                            spreadRadius: 0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        Assets.imagesImageHomepng,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text(
                          "اِبْـدَأْ بِـتَنْظِيـمِ يَوْمِـكَ",
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          Assets.imagesNavigation,
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    text1: 'القران',
                    text2: 'Quran',
                    value: '1', 
                    path: '/quranPage',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomCard(
                    text1: 'التسبيح',
                    text2: 'Tasbeeh',
                    value: '2',
                    path: '/tasbeehScreen',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    text1: 'قراء القرآن',
                    text2: 'Quran reciters',
                    value: '3', 
                    path: '/researchPage',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomCard(
                    text1: 'مواقيت الصلاة',
                    text2: 'Prayer Times',
                    value: '4', 
                    path: '/prayerPage',
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
