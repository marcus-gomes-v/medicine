import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metacard/components/default_button.dart';
import 'package:metacard/models/patient.dart';

class PatientInfoScreen extends StatefulWidget {
  static const String id = 'patient_info_screen';
  final user = FirebaseAuth.instance.currentUser!;

  PatientInfoScreen({required this.addMessage});

  final void Function(String message) addMessage;

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(debugLabel: "_PatientInfoState");
    Patient patient = Patient(user: widget.user);
    final _name = TextEditingController(text: patient.name);
    final _document = TextEditingController(text: patient.document);

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
          title: const Text(
            'Minhas Informações',
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
              const Center(
                child: Hero(
                  tag: 'logoMedicalConsult',
                  child: FaIcon(
                    FontAwesomeIcons.idCard,
                    color: Colors.teal,
                    size: 120.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
                child: Divider(
                  color: Colors.teal,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Your Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your name to continue';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _document,
                        decoration: const InputDecoration(
                          hintText: 'Your Document',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your document to continue';
                          }
                          return null;
                        },
                      ),
                      DefaultButton(
                        color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.save,
                              color: Colors.white,
                            ),
                            Text(
                              'Atualizar dados',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.addMessage(_name.text);
                            patient.name = _name.text;
                            patient.document = _document.text;
                            await patient.updatePatientInfo(patient);
                          }
                          // print('salvamo algo');
                        },
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
