// Core packages.
import 'package:flutter/material.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

class EmptyHistory extends StatefulWidget {
  @override
  _EmptyHistoryState createState() => _EmptyHistoryState();
}

class _EmptyHistoryState extends State<EmptyHistory> {
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
      initialChildSize: 0.3,
      maxChildSize: 0.95,
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
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.only(top: 0.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                margin: EdgeInsets.only(
                  top: 22.0,
                  bottom: 30.0,
                ),
                child: Text(
                  "History",
                  style: TextStyle(
                    color: CompanyColors.lightGrey,
                    fontSize: subheadFontSize,
                  ),
                ),
              ),
              Center(
                child: Image(
                  image: AssetImage("assets/images/empty-history.png"),
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
                    "Dapatkan produk Couvee favoritmu di outlet terdekat dan kumpulkan poinnya!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(
                        0xFF939A9E,
                      ),
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: FlatButton.icon(
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
                  onPressed: () => VoidCallback,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
