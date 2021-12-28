import 'package:metacard/constants.dart';
import 'package:flutter/material.dart';
import 'package:metacard/components/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                color: Colors.blueAccent,
                text: 'Register',
                onPressed: () async {
                  print(this.email);
                  print(this.password);
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: this.email, password: this.password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (error) {
                    setState(() {
                      showSpinner = false;
                    });
                    String errorMessage;

                    print(error.code);
                    switch (error.code) {
                      case "email-already-in-use":
                        errorMessage =
                            "Your email address is already registered.";
                        break;
                      case "invalid-email":
                        errorMessage =
                            "Your email address appears to be malformed";
                        break;
                      case "operation-not-allowed":
                        errorMessage =
                            "Email/Password accounts are not enabledt.";
                        break;
                      case "weak-password":
                        errorMessage =
                            "Your password is not strong enough, try 6 chars minimum.";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
                    }

                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      backgroundColor: Colors.red.shade400,
                      content: new Text(errorMessage),
                    ));
                  }
                  //Implement registration functionality.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
