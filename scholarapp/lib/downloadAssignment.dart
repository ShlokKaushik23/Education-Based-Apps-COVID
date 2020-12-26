//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'dart:async';

class DownloadAssignment extends StatelessWidget {
  final int index;

  DownloadAssignment(this.index);

  @override
  Widget build(BuildContext context) {
    var title = "Web Images";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: downloadAssignment(),

//      body: Center(
////        child: Text('this is the index #$index'),
//          ),
    );
  }
}

class downloadAssignment extends StatefulWidget {
  @override
  _downloadAssignmentState createState() => _downloadAssignmentState();
}

class _downloadAssignmentState extends State<downloadAssignment> {
  String get =
      "https://firebasestorage.googleapis.com/v0/b/guruskool-a9843.appspot.com/o/teacher%2F9Science-NcertSolutions-chapter-9-exercises-09-1.jpg?alt=media&token=3882aadc-69f5-4ca6-bfef-bf5d33f7b62d";
  @override
  void initState() {
    super.initState();
  }

  var filePath;
  String BASE_IMG;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'DOWNLOAD YOUR ASSIGNMENT',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
      body: Image.network(
        get,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      persistentFooterButtons: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            _onImageDownloadButtonPressed();
          },
          child: Icon(
            Icons.file_download,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  void _onImageDownloadButtonPressed() async {
//    _onLoading(true);
    print("_onImageDownloadButtonPressed");
    var response = await http.get(get);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
//    _onLoading(false);
  }
}
