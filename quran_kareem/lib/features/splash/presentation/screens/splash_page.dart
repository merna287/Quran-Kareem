import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    print("🚀 Splash Page Loaded");
    Future.delayed(const Duration(seconds: 3), () {
      customNavigate(context, "/homePage");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [ 
            Positioned.fill(
              child: Image.asset(
                Assets.imagesImageSplash,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              top: -100, 
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(150)),
                    gradient: RadialGradient(
                      colors: [
                      Color.fromARGB(141, 16, 236, 247), 
                      Color.fromARGB(76, 15, 211, 221), 
                      Color.fromARGB(44, 17, 42, 88)       
                      ],
                      center: Alignment.topCenter,
                      radius: 1.2,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 290,
                  height: 279,
                  child: SvgPicture.asset(
                    Assets.imagesLogoSplash2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
