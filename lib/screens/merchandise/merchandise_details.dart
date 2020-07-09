import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MerchandiseDetails extends StatelessWidget {
  const MerchandiseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 6,
            ),
            ButtonTheme(
              minWidth: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Icon(
                  Icons.arrow_back,
                  size: 16.0,
                ),
                shape: new CircleBorder(),
                elevation: 0.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            VoucherHeaderImage(
              url: './assets/images/merchandise-details.png',
            ),
            SizedBox.expand(
              child: MerchandiseDetailsHeader(),
            ),
          ],
        ),
      ),
    );
  }
}
