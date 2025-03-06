import 'package:go_router/go_router.dart';
import 'package:quran_kareem/features/splash/presentation/screens/splash_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/", 
      builder: (context, state) => const SplashPage(),  
    ),
  ],
);