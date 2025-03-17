import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_kareem/features/home/presentation/widgets/menu_item.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
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
        child: Stack(
          children: [ 

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  Assets.imagesMenuPNG,
                  width: 190,
                  height: double.infinity, 
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          customNavigate(context, "/homePage");  
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
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ 
                      SizedBox(
                        width: 200,
                        height: 170,
                        child: SvgPicture.asset(Assets.imagesLogoMenu ,fit: BoxFit.fitWidth,),
                      ), 
                      SizedBox(height: 20), 
                      MenuItem(icon: Icons.person, text: "Sign In/Profile"),
                      MenuItem(icon: Icons.star_rate, text: "Rate Us"),
                      MenuItem(icon: Icons.phone, text: "Contact Us"),
                      MenuItem(icon: Icons.info, text: "About Us"),
                      MenuItem(icon: Icons.settings, text: "Settings"),
                      MenuItem(icon: Icons.exit_to_app, text: "Sign Out"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
