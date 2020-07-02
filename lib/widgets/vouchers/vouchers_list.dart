import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:couvee/company_colors.dart';
import 'package:couvee/screens/screens.dart';

enum VoucherStatus { buy, bought }

class VouchersList extends StatefulWidget {
  final VoucherStatus status;

  const VouchersList({
    Key key,
    this.status,
  }) : super(key: key);

  @override
  _VouchersListState createState() => _VouchersListState();
}

class _VouchersListState extends State<VouchersList> {
  double screenWidth;

  double screenHeight;

  double body1FontSize;

  double subheadFontSize;

  Widget voucherItem(title, date, image) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: screenHeight * 0.26,
      decoration: BoxDecoration(
        color: CompanyColors.brown[50],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 20.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          EvaIcons.calendar,
                          color: CompanyColors.brown,
                          size: 15.0,
                        ),
                        SizedBox(width: 7.0),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                      child: FlatButton(
                        color: CompanyColors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VoucherDetailsScreen(status: widget.status),
                            ),
                          );
                        },
                        child: Text(
                          "Pakai Vocer",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            children: <Widget>[
              voucherItem(
                "Beli 1 Gratis 1",
                "Valid hingga 5 Nov, 2019 ",
                "./assets/images/voucher-image.png",
              ),
              voucherItem(
                "Diskon 30%",
                "Valid hingga 5 Nov, 2019 ",
                "./assets/images/voucher-image2.png",
              ),
              voucherItem(
                "Beli 1 Gratis 1",
                "Valid hingga 5 Nov, 2019 ",
                "./assets/images/voucher-image.png",
              ),
            ],
          ),
        );
      },
    );
  }
}
