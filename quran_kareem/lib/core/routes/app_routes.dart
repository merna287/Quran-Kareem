import 'package:go_router/go_router.dart';
import 'package:quran_kareem/features/home/presentation/screens/hamburger_menu.dart';
import 'package:quran_kareem/features/home/presentation/screens/home_page.dart';
import 'package:quran_kareem/features/page/prayer_times/screens/prayer_times.dart';
import 'package:quran_kareem/features/page/quran/quran_page.dart';
import 'package:quran_kareem/features/page/reciters/screens/details_page.dart';
import 'package:quran_kareem/features/page/reciters/screens/quran_reciters.dart';
import 'package:quran_kareem/features/page/reciters/screens/research_page.dart';
import 'package:quran_kareem/features/page/tasbeeh/tasbeeh_screen.dart';
import 'package:quran_kareem/features/page/todo/screen/todo_page.dart'; 
import 'package:quran_kareem/features/splash/presentation/screens/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",  
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/homePage",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/hamBurgerMenu",
      builder: (context, state) => const HamburgerMenu(),
    ),
    GoRoute(
      path: "/quranPage",
      builder: (context, state) => const QuranPage(),
    ),
    GoRoute(
      path: "/tasbeehScreen",
      builder: (context, state) =>  TasbeehScreen(),
    ),
    GoRoute(
      path: "/quranReciters",
      builder: (context, state) =>  QuranReciters(),
    ),
    GoRoute(
      path: "/researchPage",
      builder: (context, state) =>  ResearchPage(),
    ),
    GoRoute(
      path: "/todoPage",
      builder: (context, state) =>  TodoPage(),
    ),
    GoRoute(
  path: "/detailsPage",
  builder: (context, state) {
      final extraData = state.extra as Map<String, dynamic>;
      return DetailsPage(
        moshaf: extraData["moshaf"],
        audioList: extraData["audioList"],
      );
      },
    ),
    GoRoute(
      path: "/prayerPage",
      builder: (context, state) =>  PrayerTimes(),
    ),
  ],
);

