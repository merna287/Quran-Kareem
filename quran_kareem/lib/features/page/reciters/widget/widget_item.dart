import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';

class WidgetItem extends StatefulWidget {
  final int index;
  final String audioUrl;

  const WidgetItem({Key? key, required this.index, required this.audioUrl}) : super(key: key);

  @override
  _WidgetItemState createState() => _WidgetItemState();
}

class _WidgetItemState extends State<WidgetItem> {
  bool isPlaying = false;
  bool isDownloading = false;
  double progress = 0.0;
  double _currentPosition = 0.0;
  Duration _totalDuration = Duration.zero;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? filePath;

  @override
  void initState() {
    super.initState();
    
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position.inMilliseconds.toDouble();
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        _currentPosition = 0.0;
      });
    });

    downloadAudio();
  }

  Future<void> downloadAudio() async {
    setState(() {
      isDownloading = true;
      progress = 0.0;
    });

    Dio dio = Dio();
    
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      filePath = "${dir.path}/downloaded_audio_${widget.index}.mp3";

      await dio.download(
        widget.audioUrl,
        filePath!,
        onReceiveProgress: (received, total) {
          setState(() {
            progress = received / total;
          });
        },
      );

      setState(() {
        isDownloading = false;
      });
    } catch (e) {
      setState(() {
        isDownloading = false;
      });
    }
  }

  void togglePlayPause() async {
    if (filePath == null) return;

    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(DeviceFileSource(filePath!));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void seekAudio(double value) async {
    await _audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }

  void skipForward() async {
    final newPosition = _currentPosition + 10000;
    if (newPosition < _totalDuration.inMilliseconds) {
      await _audioPlayer.seek(Duration(milliseconds: newPosition.toInt()));
    }
  }

  void skipBackward() async {
    final newPosition = _currentPosition - 10000;
    if (newPosition > 0) {
      await _audioPlayer.seek(Duration(milliseconds: newPosition.toInt()));
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
            color: const Color.fromARGB(207, 60, 132, 173),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 13),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${widget.index + 1}",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Slider(
                      min: 0.0,
                      max: _totalDuration.inMilliseconds > 0 ? _totalDuration.inMilliseconds.toDouble() : 1.0,
                      value: _currentPosition.clamp(0.0, _totalDuration.inMilliseconds.toDouble()),
                      onChanged: (value) {
                        if (_totalDuration.inMilliseconds > 0) {
                          seekAudio(value);
                        }
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.white38,
                    ),
                  ),
                  SizedBox(width: 1),
                  IconButton(
                    onPressed: skipBackward,
                    icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
                  ),
                  IconButton(
                    onPressed: togglePlayPause,
                    icon: Icon(
                      isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                      color: isPlaying ? Colors.white : Colors.blueGrey,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: skipForward,
                    icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
