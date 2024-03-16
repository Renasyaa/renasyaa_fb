import 'package:flutter/material.dart';
import 'package:renasyaa_fb/home/home.dart';
// import 'package:renasyaa_fb/auth/widgeth_auth/view_auth.dart';
// import 'package:renasyaa_fb/crud/users/user_list.dart';
// import 'package:renasyaa_fb/storage/widgetsto/view_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shop ize',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
