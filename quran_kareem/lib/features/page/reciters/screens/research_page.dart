import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_kareem/features/page/reciters/widget/category_listview.dart';

class ResearchPage extends StatefulWidget {
  const ResearchPage({super.key});

  @override
  State<ResearchPage> createState() => _QuranRecitersState();
}

class _QuranRecitersState extends State<ResearchPage> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  Map<int, List<String>> myAudioLinksMap = {};

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
                    icon: Icon(Icons.arrow_back, color: AppColors.white),
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
                child: SizedBox(
                  width: 275,
                  height: 140,
                  child: SvgPicture.asset(
                    Assets.imagesLogoHome,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black54,
                    hintText: "Search Here",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    suffixIcon: Icon(Icons.search, color: AppColors.primarycolor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value.toLowerCase(); 
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: CategoryListview(searchText: searchText, audioLinksMap: myAudioLinksMap),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
