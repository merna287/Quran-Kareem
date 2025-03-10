import 'package:flutter/material.dart';  
import 'package:quran_kareem/core/routes/app_routes.dart';   

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,  
    );
  }
}

