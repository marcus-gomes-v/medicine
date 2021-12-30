import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {required this.color, required this.child, required this.onPressed});

  final Color color;
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 10,
          ),
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: this.child,
        ),
      ),
    );
  }
}
