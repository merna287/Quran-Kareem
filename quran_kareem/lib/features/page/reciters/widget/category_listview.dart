import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/features/page/reciters/manager/cubit.dart';
import 'package:quran_kareem/features/page/reciters/manager/state.dart';
import 'package:quran_kareem/features/page/reciters/network/api_service.dart';
import 'package:quran_kareem/features/page/reciters/widget/category.dart';

class CategoryListview extends StatelessWidget {
  final String searchText;
  final Map<int, List<String>> audioLinksMap; // جعلها final وإضافة required

  const CategoryListview({super.key, required this.searchText, required this.audioLinksMap});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(context.read<ApiService>())..fetchMoshafDetails(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is ReciterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReciterLoaded) { 
            final filteredList = state.moshafDetails.where((moshaf) {
              return moshaf["reciter_name"].toLowerCase().contains(searchText);
            }).toList();

            if (filteredList.isEmpty) {
              return Center(child: Text("لا يوجد نتائج", style: TextStyle(color: Colors.white)));
            }

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                var moshaf = filteredList[index];
                return Column(
                  children: [
                    Category(
                      index: index,
                      reciterName: moshaf["reciter_name"],
                      surahTotal: moshaf["surah_total"],
                      moshaf: moshaf, 
                      audioLinksMap: audioLinksMap,
                    ),
                    if (index != filteredList.length - 1)
                      Divider(color: Colors.grey, thickness: 0.5),
                  ],
                );
              },
            );
          } else if (state is ReciterError) {
            return Center(child: Text(state.message));
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<AppCubit>().fetchMoshafDetails(),
              child: Text("Load Reciters"),
            ),
          );
        },
      ),
    );
  }
}
