import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/player_control.dart';

class PlayerScreen extends StatefulWidget {

  final File videoFile;
  const PlayerScreen({super.key, required this.videoFile});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  late VideoPlayerController _controller;


  @override
  void initState() {
     
    super.initState();
    _controller=VideoPlayerController.file(widget.videoFile)

    ..initialize().then((_){
      setState(() {
        
      });
      _controller.play();


    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("now Playing"),),

      body: Column(

        children: [
          if(_controller.value.isInitialized)

          AspectRatio(
            aspectRatio:_controller.value.aspectRatio,
              child: VideoPlayer(_controller),

            
            ),
          PlayerControls(controller:_controller )
          
        ],
      ),
    );
  }
}