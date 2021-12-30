import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Patient {
  String name;
  dynamic avatar;

  Patient({
    required this.name,
    this.avatar = const AssetImage('images/icon-256x256.png'),
  });
}
