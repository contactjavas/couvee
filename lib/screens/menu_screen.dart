// Core packages.
import 'dart:ui';
import 'package:couvee/elements/title_section.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Extension packages.
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

// Couvee responses.
import 'package:couvee/responses/auth_response.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double screenWidth;
  double screenHeight;

  double body1FontSize;
  double subheadFontSize;

  final userBox = Hive.box("user");
  UserData user;

  @override
  void initState() {
    user = UserData(
      token: userBox.get("token"),
      id: userBox.get("id"),
      email: userBox.get('email'),
      firstName: userBox.get("firstName"),
      lastName: userBox.get("lastName"),
      displayName: userBox.get("displayName"),
      birthday: userBox.get("birthday"),
      phone: userBox.get("phone"),
      pin: userBox.get("pin"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    body1FontSize = Theme.of(context).textTheme.bodyText2.fontSize;
    subheadFontSize = Theme.of(context).textTheme.subtitle1.fontSize;

    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                    child: Text(
                      'Menu',
                      style: GoogleFonts.kanit(
                        fontSize:
                            Theme.of(context).textTheme.headline5.fontSize,
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                          color: CompanyColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox.expand(
              child: MenuSheet(
                user: this.user,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
