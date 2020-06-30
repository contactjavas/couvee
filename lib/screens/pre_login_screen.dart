// Core packages.
import 'dart:ui';
import 'package:flutter/material.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';
import 'package:couvee/screens/login_screen.dart';
import 'package:couvee/screens/register_screen.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/pre-login/interior.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.8,
            left: 0,
            bottom: 70,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/pre-login/hands.png',
                    ),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            left: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                  stops: [
                    0,
                    0.25,
                    0.47,
                    1,
                  ],
                  colors: [
                    Color(0xFF1d1d1d),
                    Color(0xFF1d1d1d),
                    Color(0xFF1d1d1d).withOpacity(0.9),
                    Color(0xFF323232).withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(45),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/couvee-logo.png',
                    height: MediaQuery.of(context).size.height / 5.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        width: MediaQuery.of(context).size.width,
        height: 155.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlineButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Udah Punya Akun Dong',
                  style: TextStyle(
                    color: CompanyColors.brown,
                  ),
                ),
                borderSide: BorderSide(
                  color: CompanyColors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
