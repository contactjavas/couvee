// Core packages.
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

import '../../company_colors.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
      initialChildSize: 0.45,
      minChildSize: 0.45,
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
          child: ListView.builder(
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0)
                return Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 23.0,
                    left: 20.0,
                  ),
                  child: Text(
                    "History",
                    style: TextStyle(
                      color: CompanyColors.lightGrey,
                      fontSize: subheadFontSize,
                    ),
                  ),
                );

              return HistoryItem();
            },
            padding: EdgeInsets.only(top: 0.0),
          ),
        );
      },
    );
  }
}
