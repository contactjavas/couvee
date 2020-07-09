// Core packages.
import 'dart:ui';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Extension packages.
import 'package:hive/hive.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:google_fonts/google_fonts.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

// Couvee responses.
import 'package:couvee/responses/auth_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: screenHeight / 12, bottom: 30.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/couvee-logo.png",
                    width: screenWidth / 6.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1.6),
                  child: Text(
                    "Selamat datang,",
                    style: TextStyle(
                      color: CompanyColors.lightGrey,
                      fontSize: body1FontSize,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    user.firstName,
                    style: GoogleFonts.kanit(
                      fontSize: Theme.of(context).textTheme.headline5.fontSize,
                      fontWeight: FontWeight.w600,
                      textStyle: TextStyle(
                        color: CompanyColors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Pointmu",
                  style: TextStyle(
                    color: CompanyColors.lightGrey,
                    fontSize: body1FontSize,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            user.points == null ? "0" : user.points.toString(),
                            style: GoogleFonts.kanit(
                              fontSize: 42,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                height: 1.23,
                                color: CompanyColors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 8.0),
                            child: Text(
                              "pts",
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                textStyle: TextStyle(
                                  color: CompanyColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45.0,
                        child: RaisedButton.icon(
                          elevation: 0.0,
                          icon: ImageIcon(
                            AssetImage("assets/images/qrcode-light.png"),
                            size: 20,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Tambah Point",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScanQrcode(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 16.0,
                            height: 16.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFC5C7C9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset("assets/images/points-icon.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.0),
                            child: Text(
                              "Silver",
                              style: TextStyle(
                                color: CompanyColors.black,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: Text(
                              "5000 pts menuju Gold",
                              style: TextStyle(
                                color: CompanyColors.lightGrey,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 14.0,
                            color: CompanyColors.brown,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RoundedProgressBar(
                  height: 3.0,
                  style: RoundedProgressBarStyle(
                    borderWidth: 0,
                    widthShadow: 0,
                    backgroundProgress:
                        CompanyColors.lightGrey.withOpacity(0.1),
                    colorProgress: CompanyColors.brown,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  percent: 30,
                ),
              ],
            ),
          ),
          SizedBox.expand(
            child: History(),
          ),
        ],
      ),
    );
  }
}
