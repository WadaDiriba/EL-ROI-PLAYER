import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class StorageService {

  static Future<File?> pickVideo()async{

    await Permission.storage.request();

    final result=await FilePicker.platform.pickFiles(

      type: FileType.video,
    );

    if(result !=null && result.files.single.path !=null){

      return File(result.files.single.path!);
    }

    return null;
  }
}