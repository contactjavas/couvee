// Core packages.
import 'dart:ui';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Extension packages.
import 'package:google_fonts/google_fonts.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

class VouchersScreen extends StatefulWidget {
  @override
  _VouchersScreenState createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen> {
  double screenWidth;
  double screenHeight;

  double body1FontSize;
  double subheadFontSize;

  int activeIndex = 0;

  void handleTab(int index) {
    setState(() {
      activeIndex = index;
    });
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
                  margin: EdgeInsets.only(top: screenHeight / 12, bottom: 10.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Vouchers",
                    style: GoogleFonts.nunito(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 1.6),
                  child: RichText(
                    text: TextSpan(
                        text: "Kamu punya ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.0,
                          textStyle: TextStyle(
                            color: CompanyColors.lightGrey,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "8000pts ",
                            style: GoogleFonts.nunito(
                              fontSize: 14.0,
                              textStyle: TextStyle(
                                color: CompanyColors.black,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "untuk ditukarkan vocer",
                            style: GoogleFonts.nunito(
                              fontSize: 14.0,
                              textStyle: TextStyle(
                                color: CompanyColors.lightGrey,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                VoucherTabs(
                  callback: handleTab,
                  activeIndex: activeIndex,
                ),
              ],
            ),
          ),
          SizedBox.expand(
            child: activeIndex == 0
                ? VouchersList(
                    status: VoucherStatus.bought,
                  )
                : VouchersList(
                    status: VoucherStatus.buy,
                  ),
          ),
        ],
      ),
    );
  }
}
