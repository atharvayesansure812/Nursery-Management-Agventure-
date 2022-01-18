import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  String email = "";
  String password = "";
  String name = " ";
  bool changeButton = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: FadeInDownBig(
            delay: Duration(milliseconds: 1500),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Lottie.network(
                              "https://assets7.lottiefiles.com/packages/lf20_xlmz9xwm.json"))
                    ],
                  ),

                  SizedBox(
                    height: 0,
                  ),

                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.green, width: 3),
                          ),
                          prefixIcon: Icon(Icons.people),
                          hintText: "Enter Your Username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter Your Password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/password');
                    },
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  InkWell(
                    onTap: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        setState(() async {
                          logincomplete(BuildContext, context);
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, '/Nursery');
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          NoUser(BuildContext, context);
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          WrongPassword(BuildContext, context);
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      // child: changeButton
                      //     ? Icon(
                      //         Icons.done,
                      //         color: Colors.white,
                      //       )
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  Text("OR", textAlign: TextAlign.center),

                  Container(
                    height: 100,
                    child: InkWell(
                      onTap: () async {
                        signInWithGoogle();
                        // FirebaseService service = new FirebaseService();
                        // try {
                        //   await service.signInwithGoogle();
                        // } catch (e) {}
                      },
                      child: Image(
                          image: NetworkImage(
                              "https://raw.githubusercontent.com/shobhitpuri/custom-google-signin-button/master/images/GoogleSignInLight.png"),
                          fit: BoxFit.fill),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Row(
                      children: [
                        Text(
                          "Don't have account? ",
                          textAlign: TextAlign.right,
                        ),
                        InkWell(
                          child: Text(
                            "Register Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        )
                      ],
                    ),
                  ),
                  //
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Nursery');
                      },
                      icon: Icon(
                        Icons.skip_next_sharp,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Skip',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

void logincomplete(BuildContext, Context) {
  var alertDialog = AlertDialog(
      title: Text("Sign in completed"),
      content: Text("Now you can buy a product"));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void NoUser(BuildContext, Context) {
  var alertDialog = AlertDialog(
      title: Text(
        "Please SignUp",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text("No account exicted "));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

void WrongPassword(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: AlertDialog(
        title: Text(
          'Entered wrong password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          "Please correct it ",
          textAlign: TextAlign.center,
        ),
      ));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
