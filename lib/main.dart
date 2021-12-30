import 'package:flutter/material.dart';
import 'package:metacard/providers/google_provider.dart';
import 'package:metacard/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:metacard/screens/verify_screen.dart';
import 'package:metacard/screens/authenticated_screen.dart';
import 'package:metacard/screens/patient/smart_service_screen.dart';
import 'package:metacard/screens/patient/time_service_screen.dart';
import 'package:metacard/screens/patient/medical_consult_screen.dart';
import 'package:metacard/screens/patient/renew_recipe_screen.dart';
import 'package:metacard/screens/patient/medical_history_screen.dart';
import 'package:metacard/screens/patient/patient_info.dart';

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
        initialRoute: VerifyScreen.id,
        routes: {
          VerifyScreen.id: (context) => VerifyScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          AuthenticatedScreen.id: (context) => AuthenticatedScreen(),
          SmartServiceScreen.id: (context) => SmartServiceScreen(),
          TimeServiceScreen.id: (context) => TimeServiceScreen(),
          MedicalConsultScreen.id: (context) => MedicalConsultScreen(),
          RenewRecipeScreen.id: (context) => RenewRecipeScreen(),
          MedicalHistoryScreen.id: (context) => MedicalHistoryScreen(),
          PatientInfoScreen.id: (context) => PatientInfoScreen(),
        },
      ),
    );
  }
}
