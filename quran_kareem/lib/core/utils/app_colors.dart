import 'package:flutter/material.dart';

abstract class AppColors {

  static const Color primarycolor = Color(0xFFF65D6FC);
  static const Color white = Color(0xFFF8F4F9);
  static const Color blue = Color(0xFF0A2060);

  static const LinearGradient backGround = LinearGradient(
    colors: [
    Color(0xFF112095),
    Color(0xFF0D3180), 
    Color(0xFF2A5298),
    Color(0xFF0842A0), 
    Color(0xFF0563C1), 
    Color(0xFF8E9EAB),
    //Color(0xFF0485E0), 
    Color(0xFF0D3180),
    Color(0xFF112095),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF65D6FC), Color(0xFF0DC7D2)],  
    begin: Alignment.topLeft,  
    end: Alignment.bottomRight, 
  );
  static const LinearGradient IconGradient = LinearGradient(
    colors: [
      Color(0xFF0563C1), 
      Color(0xFF0DC7D2),
      Color(0xFF0563C1), 
      ],  
    begin: Alignment.topLeft,  
    end: Alignment.bottomRight, 
  );
  static const LinearGradient backgroundQuran = LinearGradient(
  colors: [
    Color(0xFF1E3C72), // أزرق ملكي هادئ
    Color(0xFF2A5298), // أزرق فاتح متدرج
    Color(0xFF8E9EAB), // رمادي مزرق ناعم 
    // Color(0xFFD2CCC4), // بيج فاتح مريح
    Color(0xFF8E9EAB), // رمادي مزرق ناعم
    Color(0xFF2A5298), // أزرق فاتح متدرج
    Color(0xFF1E3C72), // أزرق ملكي هادئ
  ],  
  begin: Alignment.topLeft,  
  end: Alignment.bottomRight, 
);

}
