// Core packages.
import 'package:flutter/material.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

import '../../company_colors.dart';
import '../points-earning/scan_qrcode.dart';

class EmptyVoucher extends StatefulWidget {
  @override
  _EmptyVoucherState createState() => _EmptyVoucherState();
}

class _EmptyVoucherState extends State<EmptyVoucher> {
  double screenWidth;
  double screenHeight;

  double body1FontSize;
  double subheadFontSize;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    body1FontSize = Theme.of(context).textTheme.bodyText2.fontSize;
    subheadFontSize = Theme.of(context).textTheme.subtitle1.fontSize;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 0.95,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0.0, -5.0),
                blurRadius: 40.0,
                color: Colors.black.withOpacity(0.05),
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 100 / 55,
                child: Image(
                  image: AssetImage("assets/images/empty-voucher.png"),
                  width: screenWidth / 1.8,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                margin: EdgeInsets.only(
                  top: 25.0,
                  bottom: 27.0,
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    "Kamu belum punya vocer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CompanyColors.lightGrey,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: FlatButton(
                  child: Text(
                    "Beli Vocer",
                    style: TextStyle(
                      color: CompanyColors.brown,
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
        );
      },
    );
  }
}
