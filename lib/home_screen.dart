import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin_google/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future login() async {
    final user = await googleSignIn.signIn();
    final userAuth = await user.authentication;
    final credentials = GoogleAuthProvider.credential(
        idToken: userAuth.idToken, accessToken: userAuth.accessToken);
    await FirebaseAuth.instance.signInWithCredential(credentials);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login With Google',
        ),
      ),
      body: Center(
        child: FlatButton.icon(
          onPressed: login,
          textColor: Colors.red,
          icon: Icon(
            FontAwesomeIcons.google,
          ),
          label: Text(
            'Sign In With Google',
          ),
        ),
      ),
    );
  }
}
