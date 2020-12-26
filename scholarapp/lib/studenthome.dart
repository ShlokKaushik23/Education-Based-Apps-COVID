import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scholarapp/studenthome.dart';
import 'package:scholarapp/listViewTeacher.dart';
import 'package:scholarapp/studentupload.dart';
import 'package:scholarapp/googlesignin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "STUDENT PANEL",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.cyanAccent,
              ),
            ),
            centerTitle: true,
          ),
//      body: Container(
//        margin: EdgeInsets.fromLTRB(150, 520, 0, 0),
//        child: FlatButton(
//          onPressed: handleSignOut,
//          child: Text(
//            'Sign Out',
//            style: TextStyle(fontSize: 16.0),
//          ),
//          color: Color(0xffdd4b39),
//          textColor: Colors.white,
//          padding: EdgeInsets.all(20.0),
//        ),
//      ),

          body: Container(
            decoration: BoxDecoration(),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    UploadMultipleImageDemo()),
//                          );
//                        },
//                        textColor: Colors.white,
////                      color: Colors.red,
////                      padding: EdgeInsets.all(2.0),
//                        child: Container(
//                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.black54, width: 2.0),
//                                borderRadius: BorderRadius.circular(20),
//                                gradient: LinearGradient(colors: <Color>[
//                                  Colors.red,
//                                  Colors.blueGrey,
//                                  Colors.pink
//                                ])),
//                            child: Text(
//                              'Class 5',
//                              style: TextStyle(fontSize: 25),
//                            )),
//                      ),
                      SizedBox(
                        height: 120.0,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListViewTest()),
                          );
                        },
                        textColor: Colors.white,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[900],
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey[800],
                                    offset: Offset(-5.0, -5.0),
                                    blurRadius: 3.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]),
                            child: Text(
                              'GET YOUR ASSIGNMENTS',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )),
                      ),
//                      SizedBox(
//                        height: 40.0,
//                      ),
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    UploadMultipleImageDemo()),
//                          );
//                        },
//                        textColor: Colors.white,
//                        child: Container(
//                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.black54, width: 2.5),
//                                borderRadius: BorderRadius.circular(20),
//                                gradient: LinearGradient(colors: <Color>[
//                                  Colors.green,
//                                  Colors.greenAccent,
//                                  Colors.lightGreenAccent,
//                                ])),
//                            child: Text(
//                              'Class 7',
//                              style: TextStyle(fontSize: 25),
//                            )),
//                      ),
                      SizedBox(
                        height: 20.0,
                      ),
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    UploadMultipleImageDemo()),
//                          );
//                        },
//                        textColor: Colors.white,
//                        child: Container(
//                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.black54, width: 2.5),
//                                borderRadius: BorderRadius.circular(20),
//                                gradient: LinearGradient(colors: <Color>[
//                                  Colors.red,
//                                  Colors.blueGrey,
//                                  Colors.pink
//                                ])),
//                            child: Center(
//                              child: Text(
//                                'GET YOUR ASSIGNMS',
//                                style: TextStyle(fontSize: 20),
//                              ),
//                            )),
//                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UploadMultipleImageDemo()),
                          );
                        },
                        textColor: Colors.white,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[900],
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey[800],
                                    offset: Offset(-5.0, -5.0),
                                    blurRadius: 3.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]),
                            child: Text(
                              'UPLOAD YOUR ASSIGNMENTS',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 210.0,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UploadMultipleImageDemo()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[900],
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Colors.grey[800],
                                  offset: Offset(-3.0, -3.0),
                                  blurRadius: 3.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: FlatButton(
                            onPressed: handleSignOut,
                            child: Text(
                              'Sign Out',
                              style:
                                  TextStyle(fontSize: 25.0, color: Colors.red),
                            ),
                            color: Colors.grey[850],
                            textColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
