import 'package:flutter/material.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';

class TasbeehScreen extends StatefulWidget {
  @override
  _TasbeehScreenState createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int counter = 0;
  List<String> tasabeeh = ["سبحان الله", "الحمد لله", "الله أكبر", "لا إله إلا الله"];
  int tasbeehIndex = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter >= 30) {
        counter = 0;
        nextTasbeeh();
      }
    });
  }

  void nextTasbeeh() {
    setState(() {
      tasbeehIndex = (tasbeehIndex + 1) % tasabeeh.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: AppColors.backGround, 
      //     ),
      //   ),
      //   title: Text("Tasbeeh" , style: TextStyle(fontFamily: 'Amiri' , fontWeight: FontWeight.bold)),
      //   centerTitle: true, 
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),  
            fit: BoxFit.fill,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        customNavigate(context, "/homePage");
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
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
                SizedBox(height: 150,),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      tasabeeh[tasbeehIndex],
                      style: TextStyle(fontFamily: 'Amiri', fontSize: 45, color: AppColors.primarycolor  , fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text("عدد التسبيحات", style: TextStyle(fontSize: 20, color: Colors.white70)),
                    Text(
                      "$counter",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.indigo[200]),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: incrementCounter,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue[600],
                        child: Icon(Icons.fingerprint, color: Colors.white, size: 40),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}