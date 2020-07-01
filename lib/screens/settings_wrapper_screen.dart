import 'package:couvee/elements/title_section.dart';
import 'package:flutter/material.dart';

import '../elements/textured_wall.dart';

class SettingsWrapperScreen extends StatelessWidget {
  final Widget child;
  final String title;
  const SettingsWrapperScreen({Key key, this.child, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(children: [
            TexturedWall(),
            Column(
              children: <Widget>[
                TitleSection(
                  leading: RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Icon(
                      Icons.arrow_back,
                      size: 16.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 0.0,
                    fillColor: Colors.white,
                  ),
                  title: title,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                    child: child != null ? child : Text("blank"),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
