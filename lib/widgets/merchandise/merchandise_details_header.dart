import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:couvee/company_colors.dart';

class MerchandiseDetailsHeader extends StatefulWidget {
  const MerchandiseDetailsHeader({Key key}) : super(key: key);

  @override
  _MerchandiseDetailsHeaderState createState() =>
      _MerchandiseDetailsHeaderState();
}

class _MerchandiseDetailsHeaderState extends State<MerchandiseDetailsHeader> {
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
        initialChildSize: 0.75,
        minChildSize: 0.75,
        maxChildSize: 0.9,
        builder: (
          BuildContext context,
          ScrollController scrollController,
        ) {
          return Container(
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
            child: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 19.0,
                bottom: 25.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Seturan",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Pointmu",
                        style: TextStyle(
                          color: CompanyColors.lightGrey,
                          fontSize: 12.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        margin: EdgeInsets.only(
                          top: 5,
                          bottom: 22,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 22.0,
                              height: 22.0,
                              child: Image.asset("./assets/images/coin.png"),
                            ),
                            SizedBox(width: 8.0),
                            RichText(
                              text: TextSpan(
                                text: "8000 ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: CompanyColors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "pts",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: CompanyColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        MerchandiseDetailsItem(
                          title: "T-shirt",
                          pts: 200,
                          inStock: 4,
                          image: "assets/images/merchandise-details-item1.png",
                        ),
                        MerchandiseDetailsItem(
                          title: "Mug",
                          pts: 200,
                          inStock: 8,
                          image: "assets/images/merchandise-details-item2.png",
                        ),
                        MerchandiseDetailsItem(
                          title: "Totebag",
                          pts: 200,
                          inStock: 4,
                          image: "assets/images/merchandise-details-item3.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
