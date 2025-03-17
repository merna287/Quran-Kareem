import 'package:flutter/material.dart';
import 'package:quran_kareem/features/page/reciters/widget/widget_item.dart';

class WidgetListview extends StatelessWidget {
  final List<String> audioList;

  const WidgetListview({super.key, required this.audioList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.builder( 
        itemCount: audioList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              WidgetItem(
                index: index,
                audioUrl: audioList[index],
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
