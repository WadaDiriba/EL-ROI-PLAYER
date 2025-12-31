import 'dart:io';
import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<File>> _videos;

  @override
  void initState() {
    super.initState();
    _videos = StorageService.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El-ROI PLAYER")),
      body: FutureBuilder<List<File>>(
        future: _videos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No videos found"));
          }

          final videos = snapshot.data!;

          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final file = videos[index];

              return ListTile(
                leading: const Icon(Icons.video_file),
                title: Text(file.path.split('/').last),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlayerScreen(videoFile: file),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
