import 'package:flutter/material.dart';
import 'package:renasyaa_fb/auth/widgeth_auth/view_auth.dart';
import 'package:renasyaa_fb/crud/users/user_list.dart';
// import 'package:renasyaa_fb/storage/widgetsto/view_storage.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthView(),
                    ),
                  );
                  const SizedBox(height: 10);
                },
                child: const Text('Login Page'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserList(),
                      ));
                },
                child: const Text('Input Page'),
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const StorageView(),
              //         ));
              //   },
              //   child: const Text('Insert Image Page'),
              // ),
              // const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
