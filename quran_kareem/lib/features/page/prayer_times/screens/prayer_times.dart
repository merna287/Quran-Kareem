import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/features/page/prayer_times/widget/prayer_gridview.dart';
import 'package:quran_kareem/features/page/prayer_times/manager/cubitt.dart';
import 'package:quran_kareem/features/page/prayer_times/manager/statee.dart';

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Cubitt>().fetchMoshafDetails();
    });
  }

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

              Expanded(
                child: BlocBuilder<Cubitt, Statee>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case PrayerLoading:
                        return const Center(child: CircularProgressIndicator());

                      case PrayerLoaded:
                        final data = state as PrayerLoaded;
                        return PrayersGrid(timings: data.timings);

                      case PrayerError:
                        final errorState = state as PrayerError;
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(errorState.message, style: const TextStyle(color: Colors.red)),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => context.read<Cubitt>().fetchMoshafDetails(),
                                child: const Text("Retry"),
                              ),
                            ],
                          ),
                        );

                      default:
                        return const Center(child: Text("لم يتم تحميل البيانات بعد"));
                    }
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
