// Core packages.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Extension packages.
import 'package:hive/hive.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

// Couvee screens.
import 'package:couvee/screens/main_screen.dart';

class LockScreen extends StatefulWidget {
  LockScreen({Key key}) : super(key: key);

  _LockScreen createState() => _LockScreen();
}

class _LockScreen extends State<LockScreen> {
  static final userBox = Hive.box('user');
  final String pin = userBox.get('pin');
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PasscodeScreen(
        title: Text(
          "Masukkan pin",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CompanyColors.brown,
          ),
        ),
        backgroundColor: CompanyColors.grey.withOpacity(0.1),
        passwordEnteredCallback: (String enteredPasscode) {
          bool isValid = enteredPasscode == pin;
          _verificationNotifier.add(isValid);
        },
        isValidCallback: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        },
        cancelButton: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        deleteButton: Text(
          'Delete',
          style: const TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Delete',
        ),
        shouldTriggerVerification: _verificationNotifier.stream,
        circleUIConfig: CircleUIConfig(
          circleSize: 14.0,
          borderColor: CompanyColors.brown,
          fillColor: CompanyColors.brown,
        ),
        keyboardUIConfig: KeyboardUIConfig(
          primaryColor: CompanyColors.brown,
          // digitSize: 65,
          digitTextStyle: TextStyle(
            color: CompanyColors.brown,
            fontSize: 25.0,
          ),
          deleteButtonTextStyle: TextStyle(
            color: CompanyColors.brown,
            fontSize: 15.0,
          ),
        ),
        cancelCallback: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
      ),
    );
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
