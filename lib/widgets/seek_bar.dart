import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SeekBar extends StatelessWidget{


  final VideoPlayerController controller;

  const SeekBar({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {

    final duration=controller.value.duration;
    final position =controller.value.position;
    return  Slider(
      value:position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),

       onChanged:(value){
   
        controller.seekTo(Duration(seconds: value.toInt()));
       }
       );
  }

}