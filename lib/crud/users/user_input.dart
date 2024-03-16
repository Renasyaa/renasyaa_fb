import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renasyaa_fb/crud/ctrl_crud.dart';
import 'package:renasyaa_fb/crud/data_crud.dart';
import 'package:renasyaa_fb/models/models.dart';
import 'package:renasyaa_fb/storage/data_storage.dart';
import 'package:renasyaa_fb/storage/widgetsto/view_storage.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
                      color: Colors.green[900], fontSize: 35, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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
                TextField(
                  onChanged: (value) {
                    setState(() {
                      isShowClear1 = value.isNotEmpty;
                    });
                  },
                  style: TextStyle(
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold,
                  ),
                  controller: ctrl1,
                  decoration: InputDecoration(
                    suffixIcon: isShowClear1
                        ? IconButton(
                            onPressed: () {
                              ctrl1.clear();
                              setState(() {
                                isShowClear1 = false;
                              });
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.green[900],
                            ),
                          )
                        : null,
                    labelText: 'Name of Product',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      isShowClear2 = value.isNotEmpty;
                    });
                  },
                  style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
                  controller: ctrl2,
                  decoration: InputDecoration(
                    suffixIcon: isShowClear2
                        ? IconButton(
                            onPressed: () {
                              ctrl2.clear();
                              setState(() {
                                isShowClear2 = false;
                              });
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.green[900],
                            ),
                          )
                        : null,
                    labelText: 'Price',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      isShowClear3 = value.isNotEmpty;
                    });
                  },
                  style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
                  controller: ctrl3,
                  decoration: InputDecoration(
                    suffixIcon: isShowClear3
                        ? IconButton(
                            onPressed: () {
                              ctrl3.clear();
                              setState(() {
                                isShowClear3 = false;
                              });
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.green[900],
                            ))
                        : null,
                    labelText: 'Description',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      isShowClear4 = value.isNotEmpty;
                    });
                  },
                  style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
                  controller: ctrl4,
                  decoration: InputDecoration(
                    suffixIcon: isShowClear4
                        ? IconButton(
                            onPressed: () {
                              ctrl4.clear();
                              setState(() {
                                isShowClear4 = false;
                              });
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.green[900],
                            ))
                        : null,
                    labelText: 'Sold',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final id = UniqueKey().toString();
                    final valNama = ctrl1.text;
                    final valUmur = int.parse(ctrl2.text);
                    final valFilm = ctrl3.text;
                    final valLagu = ctrl4.text;

                    final newUser = UserX(
                      createAt: DateTime.now().toString(),
                      id: id,
                      produk: valNama,
                      sold: valUmur,
                      price: valFilm,
                      deskripsi: valLagu,
                    );

                    setState(() {
                      itsLoading = true;
                    });
                    await create(newUser.toMap());
                    setState(() {
                      itsLoading = false;
                    });

                    ctrl1.clear();
                    ctrl2.clear();
                    ctrl3.clear();
                    ctrl4.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                  ),
                  child: Text(
                    itsLoading ? 'Loading...' : 'Submit',
                    style: TextStyle(
                      color: Colors.green[50],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
