import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guru_skool/adminupdown.dart';
import 'package:guru_skool/googlesignin.dart';

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
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "TEACHER PANEL",
              style: TextStyle(
                fontWeight: FontWeight.w600,
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
            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage("Images/appimg.jpg"),
//                fit: BoxFit.cover,
//              ),
                ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
//                      color: Colors.red,
//                      padding: EdgeInsets.all(2.0),
                        child: Container(
                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(5.5, 5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5.5, -5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]),
                            child: Text(
                              'CLASS 8',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
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
                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(5.5, 5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5.5, -5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]),
                            child: Text(
                              'CLASS 9',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
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
                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(5.5, 5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5.5, -5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]),
                            child: Text(
                              'CLASS 10',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
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
                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(5.5, 5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5.5, -5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]),
                            child: Text(
                              'CLASS 11',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
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
                            padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(5.5, 5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5.5, -5.5),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]),
                            child: Text(
                              'CLASS 12',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        height: 30.0,
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
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(5.5, 5.5),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5.5, -5.5),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: FlatButton(
                            onPressed: handleSignOut,
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
//                            color: Colors.red,
//                            textColor: Colors.white,
//                            padding: EdgeInsets.all(15.0),
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
