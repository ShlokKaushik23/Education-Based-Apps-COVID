import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class UploadMultipleImageDemo extends StatefulWidget {
  UploadMultipleImageDemo() : super();

  final String title = 'UPLOAD YOUR ASSIGNMENTS';

  @override
  UploadMultipleImageDemoState createState() => UploadMultipleImageDemoState();
}

class UploadMultipleImageDemoState extends State<UploadMultipleImageDemo> {
  //
  String _path;
  String _class;
  String _subject;
  String _imageurl;
  String _firestore;
  String _getrollnumber;
  String Datasnapshot;
  String _url;
  String _geturlteacher;
  String _geturlstudent;
  final firestore = Firestore.instance;
  Map<String, String> _paths;
  String _extension;
  FileType _pickType;
  bool _multiPick = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer() async {
    try {
      _path = null;
      if (_multiPick) {
        _paths = await FilePicker.getMultiFilePath(
            type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']);
      } else {
        _path = await FilePicker.getFilePath(
            type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']);
      }
      uploadToFirebase();
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  uploadToFirebase() {
    if (_multiPick) {
      _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
    } else {
      String fileName = _path.split('/').last;
      String filePath = _path;
      upload(fileName, filePath);
    }
  }

  upload(fileName, filePath) {
    _extension = fileName.toString().split('.').last;
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child("student").child(fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(filePath),
      StorageMetadata(
        contentType: '$_pickType/$_extension',
      ),
    );
    setState(() {
      _tasks.add(uploadTask);
    });
  }

  dropDown() {
    return Container(
      child: DropdownButton(
        hint: new Text(
          'FILE TYPE',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        value: _pickType,
        items: <DropdownMenuItem>[
          new DropdownMenuItem(
            child: new Text('Audio'),
            value: FileType.audio,
          ),
          new DropdownMenuItem(
            child: new Text('Image'),
            value: FileType.image,
          ),
          new DropdownMenuItem(
            child: new Text('Video'),
            value: FileType.video,
          ),
          new DropdownMenuItem(
            child: new Text('Any'),
            value: FileType.any,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickType = value;
        }),
      ),
    );
  }

//  dropsubject() {
//    return DropdownButton(
//      hint: new Text('SUBJECT'),
//      value: _pickType,
//      items: <DropdownMenuItem>[
//        new DropdownMenuItem(
//          child: new Text('English'),
//        ),
//        new DropdownMenuItem(
//          child: new Text('Hindi'),
//        ),
//        new DropdownMenuItem(
//          child: new Text('Maths'),
//        ),
//        new DropdownMenuItem(
//          child: new Text('Science'),
//        ),
//      ],
//      onChanged: (value) => setState(() {
//        _pickType = value;
//      }),
//    );
//  }

//  dropclass() {
//    return DropdownButton(
//      hint: new Text('CLASS'),
//      items: <DropdownMenuItem>[
//        new DropdownMenuItem(
//          child: new Text('Class 5'),
//        ),
//        new DropdownMenuItem(child: new Text('Class 6')),
//        new DropdownMenuItem(child: new Text('Class 7')),
//        new DropdownMenuItem(
//          child: new Text('Class 8'),
//        ),
//      ],
//      onChanged: (value) => setState(() {
//        _pickType = value;
//      }),
//    );
//  }

  String _bytesTransferred(StorageTaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
  }

  Future<void> newGroup() {
    return firestore.collection('student').document(_class).setData({
      'Subject': _subject,
      'Image Url': _geturlstudent,
      'Roll Number': _getrollnumber,
    });
  }

  Future<void> getGroupInfo() async {
    var document =
        Firestore.instance.collection('teacher').document(_class).get();
    print(_geturlteacher);
  }

//  var groupInfo = await helper.getGroupInfo(widget.gr oupId);
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    _tasks.forEach((StorageUploadTask task) {
      final Widget tile = UploadTaskListTile(
        task: task,
        onDismissed: () => setState(() => _tasks.remove(task)),
        onDownload: () => downloadFile(task.lastSnapshot.ref),
      );
      children.add(tile);
    });

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.grey[100],
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Center(
            child: Text(
              "UPLOAD YOUR ASSIGNMENTS",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: new Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
//                    dropsubject(),
                    dropDown(),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "CLASS",
                ),
                onChanged: (value) {
                  _class = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "SUBJECT",
                  ),
                  onChanged: (value) {
                    _subject = value;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "ROLL NUMBER",
                  ),
                  onChanged: (value) {
                    _getrollnumber = value;
                  },
                ),
              ),
//              Container(
//                child: TextField(
//                  decoration: InputDecoration2
//                    border: OutlineInputBorder(),
//                    labelText: "Image Url",
//                  ),
//                  onChanged: (value) {
//                    _url = value;
//                  },
//                ),
//              ),
              SwitchListTile.adaptive(
                title: Text('Pick multiple files', textAlign: TextAlign.left),
                onChanged: (bool value) => setState(() => _multiPick = value),
                value: _multiPick,
              ),
              SizedBox(height: 25.0),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(5.0, 5.0),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => openFileExplorer(),
                        child: new Text("SELECT YOUR ASSIGNMENTS",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontSize: 15.0,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
//              Center(
//                child: Column(
//                  children: <Widget>[
//                    OutlineButton(
//                      onPressed: () => getGroupInfo(),
//                      child: new Text("Download",
//                          style: TextStyle(
//                            color: Colors.blue,
//                            fontWeight: FontWeight.w900,
//                          )),
//                    ),
//                  ],
//                ),
//              ),
              SizedBox(height: 25.0),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(5.0, 5.0),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: FlatButton(
                    onPressed: () => newGroup(),
//                  {
//                    final _firestore = firestore
//                        .collection('student')
//                        .document(_class)
//                        .setData({
//                      'Subject': _subject,
//                      'Image Url': _geturl,
//                    });
//                  },
                    child: new Text(
                      "TAP TO UPLOAD",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
//              Center(
//                child: OutlineButton(
//                  onPressed: () {
//                    _firestore.get().addOnSuccessListener
//                  },
//                  child: new Text("Download"),
//                ),
//              ),

              Flexible(
                child: ListView(
                  children: children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//  DocumentReference docRef = db.collection("student").document("");
//  docRef.get().addOnSuccessListener(new OnSuccessListener<DocumentSnapshot>(){
//    @override
//    final void onSuccess(DocumentSnapshot documentSnapshot)
//
//  })

  Future<void> downloadFile(StorageReference ref) async {
    final String _url = await ref.getDownloadURL();
    _geturlstudent = _url.toString();
    final http.Response downloadData = await http.get(_url);
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File('${systemTempDir.path}/tmp.pdf');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }
    await tempFile.create();
    final StorageFileDownloadTask task = ref.writeToFile(tempFile);
    final int byteCount = (await task.future).totalByteCount;
    var bodyBytes = downloadData.bodyBytes;
    final String name = await ref.getName();
    final String path = await ref.getPath();

    print(
      'Success!\nDownloaded $name \nUrl: $_url'
      '\npath: $path \nBytes Count :: $byteCount',
    );
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Image.memory(
          bodyBytes,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//Future _getUrl() async {
//  DocumentReference docRef =
//      Firestore.instance.collection('student').document('pdf');
//  var datasnapshot;
//  await datasnapshot == docRef.get();
//  String data = datasnapshot.data['url'];
//  return data;
//}
//Future<student> getGroupInfo(String _class) async {
//  var document =
//      Firestore.instance.collection("student").document(_class).get();
//  return await document.then((doc) {
//    return student.setGroup(doc);
//  });
//}

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile(
      {Key key, this.task, this.onDismissed, this.onDownload})
      : super(key: key);

  final StorageUploadTask task;
  final VoidCallback onDismissed;
  final VoidCallback onDownload;

  String get status {
    String result;
    if (task.isComplete) {
      if (task.isSuccessful) {
        result = 'Complete';
      } else if (task.isCanceled) {
        result = 'Canceled';
      } else {
        result = 'Failed ERROR: ${task.lastSnapshot.error}';
      }
    } else if (task.isInProgress) {
      result = 'Uploading';
    } else if (task.isPaused) {
      result = 'Paused';
    }
    return result;
  }

  String _bytesTransferred(StorageTaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context,
          AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
        Widget subtitle;
        if (asyncSnapshot.hasData) {
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
          subtitle = Text('$status: ${_bytesTransferred(snapshot)} bytes sent');
        } else {
          subtitle = const Text('Starting...');
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_) => onDismissed(),
          child: ListTile(
            title: Text('Upload Task #${task.hashCode}'),
            subtitle: subtitle,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: !task.isInProgress,
                  child: IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () => task.pause(),
                  ),
                ),
                Offstage(
                  offstage: !task.isPaused,
                  child: IconButton(
                    icon: const Icon(Icons.file_upload),
                    onPressed: () => task.resume(),
                  ),
                ),
                Offstage(
                  offstage: task.isComplete,
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => task.cancel(),
                  ),
                ),
                Offstage(
                  offstage: !(task.isComplete && task.isSuccessful),
                  child: IconButton(
                    icon: const Icon(Icons.branding_watermark),
                    onPressed: onDownload,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
