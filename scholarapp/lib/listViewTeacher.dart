import 'package:flutter/material.dart';
import 'package:scholarapp/googlesignin.dart';
import 'package:scholarapp/studenthome.dart';
import 'package:scholarapp/studentupload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:scholarapp/downloadAssignment.dart';

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Center(
          child: Text(
            "YOUR ASSIGNMENTS",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('teacher').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot teacher = snapshot.data.documents[index];
                return Card(
                  color: Colors.grey[900],
                  child: ListTile(
                    leading: Image.network(teacher['Image Url']),
                    title: Text(
                      teacher['Subject'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      teacher['Teacher Name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.cyanAccent,
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
