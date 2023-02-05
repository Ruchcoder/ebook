import 'dart:io';

import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';



///responsible for opening the pdf file and viewing it
class ReaderPage  extends StatefulWidget {
  //loading documents and its of type file i.e from your phone files on pub.dev
  const ReaderPage ({Key? key, required this.document}) : super(key: key);

  //using the load from file method to load the pdf
  final File document;
  @override
  State<ReaderPage > createState() => _ReaderPageState();
  //To keep track of the UI, As a lifecycle in Kotlin call the init state


}

class _ReaderPageState extends State<ReaderPage > {

  late PDFDocument doc;
  var isLoading = false;

  void initState() async {
    super.initState();
    doc = await PDFDocument.fromFile(widget.document);
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: isLoading
              ?PDFViewer(document: doc)
              :CircularProgressIndicator()

      ),
    );
  }
}
