import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeCrud extends StatelessWidget {
  const HomeCrud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            OutlinedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('Satu').doc('aku').set({'nama': 'diriku'});
              },
              child: const Text('Create'),
            ),
            OutlinedButton(
              onPressed: () async {
                final result = await FirebaseFirestore.instance.collection('Satu').get();
                debugPrint(result.toString());
                debugPrint(result.docs.toString());
                debugPrint(result.docs[0].toString());
                debugPrint(result.docs[0].id.toString());
                debugPrint(result.docs[0].data().toString());
                debugPrint(result.docs[0].data().runtimeType.toString());
                debugPrint(result.docs[0].data()['nama'].toString());
              },
              child: const Text('Read'),
            ),
            OutlinedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('Satu').doc('aku').set(
                  {'nama': 'me'},
                );
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('Satu').doc('aku').delete();
              },
              child: const Text('Delete'),
            ),
          ],
        ));
  }
}
