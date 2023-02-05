import 'dart:io';

import 'package:ebook/reader_page.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EBOOK READER"),
      ),
      body: Container(
        child: ListView(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.folder_open),
        onPressed: () async{
          await _SelectFile(context);
          //create a reader page next that's responsible for opening the pdf file and viewing it
        },
      ),
    );
  }

  Future<void> _SelectFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["pdf","jpg"]);
    if (result!=null){
      //the user select a file.
      //create file instance and specify the path,
            File docFile = File(result.files.first.path!);

      debugPrint(result.files.first.path);
      //navigate to reader page
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>ReaderPage(document: docFile,))
      );
    }
    else{
      //do a toast by using scaffoldMessenger if user cancel the selection
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Files Selection Cancel"),

      ),
      );


    }
  }
}
