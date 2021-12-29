import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metacard/components/default_button.dart';
import 'package:metacard/providers/google_provider.dart';
import 'package:provider/provider.dart';
import 'package:metacard/screens/verify_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  Widget typewritterAnimation(String text) {
    return Expanded(
      flex: 5,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.w900,
          color: Colors.blueGrey,
        ),
        child: AnimatedTextKit(
          pause: Duration(seconds: 3),
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              text,
              speed: const Duration(milliseconds: 81),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1, milliseconds: 200), vsync: this);
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: const Icon(
                        Icons.task,
                        size: 51.0,
                        color: Colors.black38,
                      ),
                      height: 60.0,
                    ),
                  ),
                ),
                typewritterAnimation('Metacard'),
              ],
            ),
            SizedBox(
              height: 28.0,
            ),
            DefaultButton(
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  Text(
                    'Logar com o Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
