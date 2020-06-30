// Core packages.
import 'package:flutter/material.dart';

// Extension packages.
import 'package:hive/hive.dart';

// Couvee dialogs.
import 'package:couvee/dialogs/error_dialog.dart';

// Couvee screens.
import 'package:couvee/screens/splash_screen.dart';
// import 'package:couvee/screens/lock_screen.dart';
import 'package:couvee/screens/main_screen.dart';
import 'package:couvee/screens/onboarding_screen.dart';
import 'package:couvee/screens/pre_login_screen.dart';

class ScreenSelector extends StatelessWidget {
  const ScreenSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Hive.openBox('setting'),
        Hive.openBox('user'),
      ]),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SplashScreen();
        }

        if (snapshot.error != null) {
          ErrorDialog.show(
            context,
            "Terjadi kesalahan. Coba keluar dan mulai ulang aplikasi.",
          );

          return SplashScreen();
        }

        final userBox = Hive.box('user');
        final settingBox = Hive.box('setting');

        if (userBox.get('id') != null) {
          // return LockScreen();
          return MainScreen();
        }

        return settingBox.get('hideOnboarding') != null
            ? PreLoginScreen()
            : OnboardingScreen();
      },
    );
  }
}
