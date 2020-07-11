import 'package:flutter/material.dart';

import 'package:couvee/company_colors.dart';
import 'package:couvee/widgets/widgets.dart';

class Product {
  final String title;
  final int pts;
  final int inStock;
  final String image;

  Product({
    this.title,
    this.pts,
    this.inStock,
    this.image,
  });
}

class MerchandiseDetailsHeader extends StatefulWidget {
  const MerchandiseDetailsHeader({Key key}) : super(key: key);

  @override
  _MerchandiseDetailsHeaderState createState() =>
      _MerchandiseDetailsHeaderState();
}

class _MerchandiseDetailsHeaderState extends State<MerchandiseDetailsHeader> {
  int ptsSum = 0;

  double screenWidth;

  double screenHeight;

  double body1FontSize;

  double subheadFontSize;

  List<Product> products = [
    Product(
        title: "T-Shirt",
        inStock: 4,
        pts: 200,
        image: "assets/images/merchandise-details-item1.png"),
    Product(
        title: "Mug",
        inStock: 8,
        pts: 200,
        image: "assets/images/merchandise-details-item2.png"),
    Product(
        title: "Totebag",
        inStock: 4,
        pts: 200,
        image: "assets/images/merchandise-details-item3.png"),
  ];

  void handlePts(int pts) {
    setState(() {
      ptsSum = pts;
    });
  }

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
                      children: products
                          .map(
                            (e) => MerchandiseDetailsItem(
                              title: e.title,
                              pts: e.pts,
                              inStock: e.inStock,
                              image: e.image,
                              handlePts: handlePts,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  ptsSum > 0
                      ? MerchandiseBottom(
                          ptsSum: ptsSum,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
