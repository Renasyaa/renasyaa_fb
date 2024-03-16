// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renasyaa_fb/storage/ctrl_storage.dart';
import 'package:renasyaa_fb/storage/data_storage.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: RichText(
          text: TextSpan(
              text: 'Shop',
              style: TextStyle(
                color: Colors.green[50],
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '(W)',
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ignore: prefer_const_constructors
                TextSpan(
                    text: 'ize',
                    style: TextStyle(
                        color: Colors.green[50],
                        fontSize: 27,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold))
              ]),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Uri url = Uri.parse('https://console.firebase.google.com/project/renasyaa-fb/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(
              SimpleIcons.firebase,
            ),
            iconSize: 25,
          ),
          IconButton(
            onPressed: () async {
              Uri url = Uri.parse('https://github.com/Renasyaa/renasyaa_fb');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(
              SimpleIcons.github,
            ),
            iconSize: 25,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final imagepicker = await ImagePicker().pickImage(source: ImageSource.gallery);
                  pickedFile = imagepicker;
                  setState(() {});
                },
                child: const Text('Pick Images'),
              ),
              const SizedBox(height: 10),
              Text('${pickedFile?.path}', textAlign: TextAlign.center),
              pickedFile == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(pickedFile!.path),
                    ),
              const SizedBox(height: 10),
              pickedFile == null ? const SizedBox.shrink() : const UploadButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadButton extends StatefulWidget {
  const UploadButton({super.key});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: uploadpickedFile == null ? Future.delayed(Duration.zero) : uploadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {}

            return ElevatedButton(
              onPressed: () async {
                uploadpickedFile = pickedFile;
                final getUrl = await uploadImage();
                imageUrl = getUrl;
                setState(() {});
              },
              child: const Text(
                "Upload",
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Text(imageUrl, textAlign: TextAlign.center),
        const SizedBox(height: 10),
        imageUrl.isEmpty ? const SizedBox.shrink() : SizedBox(height: 100, width: 100, child: Image.network(imageUrl))
      ],
    );
  }
}
