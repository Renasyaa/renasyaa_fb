import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:renasyaa_fb/storage/data_storage.dart';

Future<String> uploadImage() async {
  final imageName = uploadpickedFile!.name;
  final imageType = uploadpickedFile!.mimeType;
  final imageId = UniqueKey().toString();
  final imagesBytes = await uploadpickedFile!.readAsBytes();

  final task = await FirebaseStorage.instance.ref('$imageId  $imageName').putData(
        imagesBytes,
        SettableMetadata(contentType: imageType),
      );
  final url = await task.ref.getDownloadURL();
  return url;
}
