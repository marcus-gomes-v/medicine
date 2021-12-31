import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metacard/providers/google_provider.dart';
import 'package:provider/provider.dart';
import 'package:metacard/components/default_button.dart';
import 'package:metacard/screens/patient/time_service_screen.dart';
import 'package:metacard/screens/patient/medical_consult_screen.dart';
import 'package:metacard/screens/patient/renew_recipe_screen.dart';
import 'package:metacard/screens/patient/medical_history_screen.dart';
import 'package:metacard/screens/patient/patient_info.dart';
import 'package:metacard/models/patient.dart';

class AuthenticatedScreen extends StatefulWidget {
  static const String id = 'authenticated_screen';
  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<AuthenticatedScreen> createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  @override
  Widget build(BuildContext context) {
    Patient patient = Patient(user: widget.user);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.tealAccent,
          onPressed: () {
            print('Some Function');
          },
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.teal,
          ),
        ),
        appBar: AppBar(
          title: const Text('Medicine'),
          backgroundColor: Colors.teal,
          actions: [
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogout();
              },
              child: const FaIcon(
                FontAwesomeIcons.powerOff,
                color: Color(0x88c0392b),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: patient.avatar!,
                  backgroundColor: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  patient.user.displayName!,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultButton(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Hero(
                      tag: 'logoPatientInfo',
                      child: FaIcon(
                        FontAwesomeIcons.idCard,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Minhas Informações',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PatientInfoScreen.id);
                },
              ),
              DefaultButton(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Hero(
                      tag: 'logoTimeService',
                      child: FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Tempo de atendimento',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, TimeServiceScreen.id);
                },
              ),
              DefaultButton(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'logoMedicalConsult',
                      child: FaIcon(
                        FontAwesomeIcons.clinicMedical,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Consulta Médica',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MedicalConsultScreen.id);
                },
              ),
              DefaultButton(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'logoRenewRecipe',
                      child: FaIcon(
                        FontAwesomeIcons.receipt,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Renovação de receita',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RenewRecipeScreen.id);
                },
              ),
              DefaultButton(
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: 'logoMedicalHistory',
                      child: FaIcon(
                        FontAwesomeIcons.list,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Histórico Médico',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MedicalHistoryScreen.id);
                },
              ),
            ],
          ),
        ));
  }
}
