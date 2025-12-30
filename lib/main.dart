import'package:flutter/material.dart';


void main(){

  runApp( const VideoPlayerApp());
}

class  VideoPlayerApp extends StatelessWidget{

  const VideoPlayerApp({super.key});



@override

Widget build(BuildContext context) {
  return MaterialApp(
      title: "El-ROI PLAYER",
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(),

      home: const HomeScreen(),

  );
}
}