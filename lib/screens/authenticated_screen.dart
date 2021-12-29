import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticatedScreen extends StatefulWidget {
  static const String id = 'authenticated_screen';
  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<AuthenticatedScreen> createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Some Function');
          },
          child: Container(
            child: FaIcon(FontAwesomeIcons.plus),
          ),
        ),
        appBar: AppBar(
          title: Text('Metacard'),
          backgroundColor: Colors.black26,
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: FaIcon(
                FontAwesomeIcons.powerOff,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Profile"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.user.photoURL!),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(widget.user.displayName!),
            )
          ],
        ));
  }
}
