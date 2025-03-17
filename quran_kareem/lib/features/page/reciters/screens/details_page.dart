import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/core/function/navigation.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/features/page/reciters/manager/cubit.dart';
import 'package:quran_kareem/features/page/reciters/manager/state.dart';
import 'package:quran_kareem/features/page/reciters/network/api_service.dart';
import 'package:quran_kareem/features/page/reciters/widget/widget_listview.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> moshaf;
  final List<String>? audioList; 

  const DetailsPage({
    super.key,
    required this.moshaf,
    this.audioList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(ApiService())
        ..fetchAudioFiles(moshaf["server"], moshaf["surah_total"]),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          customNavigate(context, "/researchPage");
                        },
                        icon: Icon(Icons.arrow_back, color: AppColors.white),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(Assets.imagesImageprofile),
                      ),
                    ],
                  ),
                ),
                Expanded( 
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      if (state is AudioLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is AudioLoaded) {
                        return WidgetListview(audioList: state.audioList.cast<String>());
                      } else if (state is AudioError) {
                        return Center(child: Text("⚠ ${state.message}"));
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
