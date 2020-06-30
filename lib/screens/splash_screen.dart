// Core packages.
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/couvee-logo.png',
          height: 128.0,
          width: 128.0,
        ),
      ),
    );
  }
}
