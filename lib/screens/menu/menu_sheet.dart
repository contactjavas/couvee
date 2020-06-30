// Core packages.
import 'package:couvee/screens/menu/account_preview_block.dart';
import 'package:couvee/screens/menu/menu_list_block.dart';
import 'package:flutter/material.dart';

// Couvee packages.

// Couvee responses.
import 'package:couvee/responses/auth_response.dart';

class MenuSheet extends StatefulWidget {
  final UserData user;
  
  MenuSheet({Key key, @required this.user}) : super(key: key);

  _MenuSheetState createState() => _MenuSheetState();
}

class _MenuSheetState extends State<MenuSheet> {
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
      initialChildSize: 0.8,
      minChildSize: 0.8,
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
          child: Column(
            children: <Widget>[
              AccountPreviewBlock(
                user: widget.user,
              ),
              MenuListBlock(
                scrollController: scrollController,
              )
            ],
          ),
        );
      },
    );
  }
}
