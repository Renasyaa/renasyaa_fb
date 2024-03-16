import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

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
            StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) => Column(
                      children: [
                        snapshot.hasData
                            ? Column(
                                children: [
                                  Text('id: ${snapshot.data!.uid}'),
                                  const SizedBox(height: 10),
                                  Text(snapshot.data!.isAnonymous ? 'Anonymous' : 'email: ${snapshot.data!.email}'),
                                  const SizedBox(height: 10),
                                ],
                              )
                            : const Text(' '),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: snapshot.data == null
                              ? () async {
                                  final authgo = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
                                  await FirebaseAuth.instance.signInWithPopup(authgo);
                                }
                              : null,
                          child: const Text(
                            "Login By Google",
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: snapshot.data == null
                              ? () async {
                                  final authanon = await FirebaseAuth.instance.signInAnonymously();
                                  debugPrint(authanon.user.toString());
                                  debugPrint(authanon.user?.uid.toString());
                                  debugPrint(authanon.user?.refreshToken.toString());
                                }
                              : null,
                          child: const Text(
                            "Login By Anonymous",
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: snapshot.data == null
                              ? null
                              : () async {
                                  await FirebaseAuth.instance.signOut();
                                },
                          child: const Text(
                            "Logout",
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: snapshot.data == null
                              ? null
                              : () async {
                                  await FirebaseAuth.instance.currentUser!.delete();
                                },
                          child: const Text(
                            "Delete Account",
                          ),
                        ),
                      ],
                    )
                // : const Text(' '),
                ),
            // const SizedBox(height: 10),
            // StreamBuilder(
            //   stream: FirebaseAuth.instance.authStateChanges(),
            //   builder: (context, snapshot) {
            //     return Column(
            //       children: [
            //         // ElevatedButton(
            //         //   onPressed: snapshot.data == null
            //         //       ? () async {
            //         //           final authgo = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
            //         //           await FirebaseAuth.instance.signInWithPopup(authgo);
            //         //         }
            //         //       : null,
            //         //   child: const Text(
            //         //     "Login By Google",
            //         //   ),
            //         // ),
            //         // const SizedBox(height: 10),
            //         // ElevatedButton(
            //         //   onPressed: snapshot.data == null
            //         //       ? () async {
            //         //           final authanon = await FirebaseAuth.instance.signInAnonymously();
            //         //           debugPrint(authanon.user.toString());
            //         //           debugPrint(authanon.user?.uid.toString());
            //         //           debugPrint(authanon.user?.refreshToken.toString());
            //         //         }
            //         //       : null,
            //         //   child: const Text(
            //         //     "Login By Anonymous",
            //         //   ),
            //         // ),
            //         // const SizedBox(height: 10),
            //         // ElevatedButton(
            //         //   onPressed: snapshot.data == null
            //         //       ? null
            //         //       : () async {
            //         //           await FirebaseAuth.instance.signOut();
            //         //         },
            //         //   child: const Text(
            //         //     "Logout",
            //         //   ),
            //         // ),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
