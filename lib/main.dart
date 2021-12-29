import 'package:flutter/material.dart';
import 'package:metacard/providers/google_provider.dart';
import 'package:metacard/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:metacard/screens/verify_screen.dart';
import 'package:metacard/screens/authenticated_screen.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(Medicine());
}

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: VerifyScreen.id,
        routes: {
          VerifyScreen.id: (context) => VerifyScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          AuthenticatedScreen.id: (context) => AuthenticatedScreen(),
        },
      ),
    );
  }
}
