import 'package:flutter/material.dart';
import 'package:quran_kareem/core/routes/app_routes.dart';
import 'package:quran_kareem/features/page/prayer_times/manager/cubitt.dart';
import 'package:quran_kareem/features/page/prayer_times/network/api.dart';
import 'package:quran_kareem/features/page/reciters/manager/cubit.dart';
import 'package:quran_kareem/features/page/reciters/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();  
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
        Provider<ApiService>(
          create: (context) => ApiService(),
        ),
        Provider<Api>(
          create: (context) => Api(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(context.read<ApiService>()),
        ),
        BlocProvider<Cubitt>( 
          create: (context) => Cubitt(context.read<Api>()), 
        ),
      ],
      child: MaterialApp.router(
        
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
