import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metacard/providers/google_provider.dart';
import 'package:provider/provider.dart';
import 'package:metacard/components/default_button.dart';

class MedicalHistoryScreen extends StatefulWidget {
  static const String id = 'medical_history_screen';
  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.tealAccent,
          onPressed: () {
            print('Some Function');
          },
          child: Container(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.teal,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            'Histórico Médico',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: 'logoMedicalHistory',
                  child: FaIcon(
                    FontAwesomeIcons.list,
                    color: Colors.teal,
                    size: 120.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
