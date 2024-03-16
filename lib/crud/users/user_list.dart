import 'package:flutter/material.dart';
import 'package:renasyaa_fb/crud/ctrl_crud.dart';
import 'package:renasyaa_fb/crud/users/user_detail.dart';
import 'package:renasyaa_fb/crud/users/user_input.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Create(),
                ),
              );
            },
            // ignore: sort_child_properties_last
            child: Icon(Icons.add, color: Colors.green[50]),
            backgroundColor: Colors.green[800],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() {});
              },
              // ignore: sort_child_properties_last
              child: Icon(
                Icons.refresh_sharp,
                color: Colors.green[50],
              ),
              backgroundColor: Colors.green[800]),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
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
        // backgroundColor: Colors.brown[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder(
              future: getColl(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final length = snapshot.data!.length;
                  return Column(
                    children: [
                      ...List.generate(length, (index) {
                        final id = snapshot.data![index].id;
                        final createAt = snapshot.data![index].createAt;
                        return Card(
                          child: ListTile(
                            tileColor: Colors.green[900],
                            textColor: Colors.green[50],
                            title: Text(snapshot.data![index].produk),
                            subtitle: Text(createAt),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Detail(id: id)),
                              );
                            },
                          ),
                        );
                      })
                    ],
                  );
                }
                return const Center(child: Text(''));
              },
            ),
          ],
        ),
      ),
    );
  }
}
