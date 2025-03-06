import 'package:flutter/material.dart';

abstract class AppColors {

  static const Color primarycolor = Color(0xFFF65D6FC);
  static const Color white = Color(0xFFF8F4F9);
  static const Color blue = Color(0xFF0A2060);

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF65D6FC), Color(0xFF0DC7D2)],  
    begin: Alignment.topLeft,  
    end: Alignment.bottomRight, 
  );
}
