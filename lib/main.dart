import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EBOOK READER',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  HomePage(title: 'Flutter Demo Home Page'),
    );//flutter pub add file_picker
  }
}

