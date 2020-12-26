import 'package:flutter/material.dart';
import 'package:guru_skool/googlesignin.dart';
import 'package:guru_skool/homepage.dart';
import 'package:guru_skool/adminupdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:guru_skool/assignmentdownload.dart';

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "STUDENT ASSIGNMENTS",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("student").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot student = snapshot.data.documents[index];
                return Card(
                  color: Colors.white,
//                  margin: EdgeInsets.fromLTRB(1, 0, 1, 1.5),
                  child: ListTile(
                    leading: Image.network(student['Image Url']),
                    title: Text(student['Subject']),
                    subtitle: Text(student['Roll Number']),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DownloadAssignment(index)),
                        );
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
