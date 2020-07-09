import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Merchandise extends StatelessWidget {
  const Merchandise({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            MerchandiseHeader(),
            SizedBox.expand(child: MerchandiseList()),
          ],
        ),
      ),
    );
  }
}
