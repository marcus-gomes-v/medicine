import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authenticated_screen.dart';
import 'welcome_screen.dart';

class VerifyScreen extends StatelessWidget {
  static const String id = 'verify_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return AuthenticatedScreen();
          } else if (snapshot.hasError) {
            print('Aconteceu alguma coisa');
            return WelcomeScreen();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
