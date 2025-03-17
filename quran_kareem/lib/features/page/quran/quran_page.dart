import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_library/quran_library.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _MState();
}

class _MState extends State<QuranPage> {
  bool isDark = true;
  bool isInitialized = false; 

  @override
  void initState() {
    super.initState();
    initQuranLibrary();
  }

  Future<void> initQuranLibrary() async {
    await QuranLibrary().init();
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Color(0xffFDFAEB) : Color(0xff000000),
        leading: IconButton(
          onPressed: () {
            customNavigate(context, "/homePage");
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primarycolor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: isDark
                  ? Icon(Icons.wb_sunny, color: Colors.amber)
                  : Icon(Icons.nightlight_round),
            ),
          ),
        ],
      ),
      body: isInitialized
          ? QuranLibraryScreen(
              withPageView: true,
              bookmarkList: [],
              onFontsAyahLongPress: (details, ayah) {},
              textColor: isDark ? Color(0xff000000) : Color(0xffFDFAEB),
              backgroundColor: isDark ? Color(0xffFDFAEB) : Color(0xff000000),
            )
          : Center(child: CircularProgressIndicator()), // عرض لودينج أثناء التهيئة
    );
  }
}
