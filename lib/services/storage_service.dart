import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {

  /// Get ALL video files from internal storage (no folder limit)
  static Future<List<File>> getVideos() async {
    final List<File> videos = [];

    // Get Android internal storage root
    final Directory? baseDir = await getExternalStorageDirectory();
    if (baseDir == null) return videos;

    // Go to /storage/emulated/0/
    final Directory rootDir =
        Directory(baseDir.parent.parent.parent.parent.path);

    // Video extensions (add more if needed)
    const videoExtensions = [
      '.mp4',
      '.mkv',
      '.avi',
      '.mov',
      '.flv',
      '.wmv',
      '.webm',
      '.3gp',
      '.mpeg',
      '.mpg'
    ];

    try {
      // Scan ALL folders recursively
      final List<FileSystemEntity> files =
          rootDir.listSync(recursive: true, followLinks: false);

      for (final file in files) {
        if (file is File) {
          final path = file.path.toLowerCase();

          // Check if file is a video
          if (videoExtensions.any((ext) => path.endsWith(ext))) {
            videos.add(file);
          }
        }
      }
    } catch (e) {
      // Prevent crash if some folders are restricted
      print("Storage scan error: $e");
    }

    return videos;
  }
}
