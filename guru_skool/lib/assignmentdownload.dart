//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';

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
      "https://firebasestorage.googleapis.com/v0/b/guruskool-a9843.appspot.com/o/student%2FIMG_20160914_230009%20(1).jpg?alt=media&token=9cb4a351-469e-43e1-811f-385764d34d0f";
  @override
  void initState() {
    super.initState();
  }

  var filePath;
  String BASE_IMG;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'DOWNLOAD STUDENTS WORK',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontWeight: FontWeight.w600,
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
          backgroundColor: Colors.black,
          onPressed: () {
            _onImageDownloadButtonPressed();
          },
          child: Icon(
            Icons.file_download,
            color: Colors.white,
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
