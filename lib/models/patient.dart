import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'address.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Patient {
  User user;

  String? gender;
  String? ethnicity;
  DateTime? birthDate;
  Address? address;
  String? profession;
  String? maritalStatus;
  String? document;
  String? name;

  Patient({
    this.name,
    required this.user,
    this.gender,
    this.ethnicity,
    this.birthDate,
    this.address,
    this.profession,
    this.maritalStatus,
    this.document,
  });

  dynamic get avatar {
    return this.user.photoURL != null
        ? NetworkImage(this.user.photoURL!)
        : const AssetImage('images/icon-256x256.png');
  }

  Future<void> updatePatientInfo(Patient patientData) async {
    Future<void> recoreded;

    var fireStoreUserRef =
        await FirebaseFirestore.instance.collection('users').doc(this.user.uid);

    var userServiceAddress = {
      'userId': this.user.uid,
      'name': patientData.name,
      'document': patientData.document,
    };

    try {
      recoreded = fireStoreUserRef.update({'user_info': userServiceAddress});
    } catch (e) {
      recoreded = fireStoreUserRef.set({'user_info': userServiceAddress});
    }

    return recoreded;
  }
}
