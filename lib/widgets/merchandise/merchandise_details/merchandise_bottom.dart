import 'package:couvee/company_colors.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MerchandiseBottom extends StatelessWidget {
  final int ptsSum;
  const MerchandiseBottom({Key key, this.ptsSum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 7.0,
      ),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: CompanyColors.brown,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.only(
          top: 16.0,
          right: 10.0,
          bottom: 16.0,
          left: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$ptsSum pts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  "3 items",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    isDismissible: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          35.0,
                        ),
                        topRight: Radius.circular(
                          35.0,
                        ),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return QrBottomModal();
                    });
              },
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 14.0,
                    child: Image.asset("assets/images/coin-solid.png"),
                  ),
                  SizedBox(width: 3.0),
                  Text(
                    "Redeem Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
