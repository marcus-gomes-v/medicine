import 'package:metacard/constants.dart';
import 'package:flutter/material.dart';
import 'package:metacard/components/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  this.email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  this.password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              DefaultButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpiner = true;
                  });
                  try {
                    final existingUser = await _auth.signInWithEmailAndPassword(
                        email: this.email, password: this.password);
                    if (existingUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpiner = false;
                    });
                  } catch (error) {
                    setState(() {
                      showSpiner = false;
                    });
                    String errorMessage;

                    print(error.code);
                    switch (error.code) {
                      case "invalid-email":
                        errorMessage =
                            "Your email address appears to be malformed.";
                        break;
                      case "wrong-password":
                        errorMessage = "Your password is wrong.";
                        break;
                      case "user-not-found":
                        errorMessage = "User with this email doesn't exist.";
                        break;
                      case "user-disabled":
                        errorMessage =
                            "User with this email has been disabled.";
                        break;
                      case "too-many-requests":
                        errorMessage = "Too many requests. Try again later.";
                        break;
                      case "operation-not-allowed":
                        errorMessage =
                            "Signing in with Email and Password is not enabled.";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
                    }

                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      backgroundColor: Colors.red.shade400,
                      content: new Text(errorMessage),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
