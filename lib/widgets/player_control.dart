import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'seek_bar.dart';
class PlayerControls extends StatelessWidget{

  final VideoPlayerController controller;

  const PlayerControls({super.key, required this.controller});

 @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SeekBar(controller:controller),

        IconButton(
          onPressed:(){
            controller.value.isPlaying
            ?controller.pause()
            :controller.play();

          }, icon:Icon(

            controller.value.isPlaying
            ?Icons.pause
            :Icons.play_arrow,
          ))
      ],
    );
  }
}