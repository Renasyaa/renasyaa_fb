import 'package:flutter/material.dart';
import 'package:renasyaa_fb/crud/ctrl_crud.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
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

        //
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getDoc(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                'Loading...',
                style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold, fontSize: 14),
              );
            }
            if (snapshot.hasData) {
              final x = snapshot.data!;
              // final x = snapshot.data!;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    //
                    // margin: const EdgeInsets.all(10),
                    child: Text(
                      x.produk,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    // decoration: BoxDecoration(
                    //   // color: Colors.green[900],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // margin: const EdgeInsets.all(10),
                    child: Text(
                      x.sold.toString(),
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    // decoration: BoxDecoration(
                    //   // color: Colors.green[900],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // margin: const EdgeInsets.all(10),
                    child: Text(
                      x.price,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    // decoration: BoxDecoration(
                    //   // color: Colors.green[900],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // margin: const EdgeInsets.all(10),
                    child: Text(
                      x.deskripsi,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Text('');
          },
        ),
      ),
    );
  }
}
