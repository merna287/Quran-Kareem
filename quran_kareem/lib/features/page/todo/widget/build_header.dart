import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              customNavigate(context, "/homePage");
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
    );
  }
}