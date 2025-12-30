import 'dart:io';
import'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'player_screen.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen({super.key});

  
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

             title: Text("El-ROI PLAYER",
             
            
             ),

        ),

        body: Center(

          child: ElevatedButton.icon(

            icon: const Icon(Icons.video_library),
            onPressed:() async{
              File? video=await StorageService.pickVideo();

              if(video !=null){

                Navigator.push(context,
                
                 MaterialPageRoute(builder: (context)=>PlayerScreen(videoFile:video),
                 
                 )
                 
                 );
              }


            },
            
             label: Text("Pick video"),


             ),
        ),

    );
  }
}
