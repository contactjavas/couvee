import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class MerchandiseConfirmModal extends StatelessWidget {
  const MerchandiseConfirmModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.68,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 1),
          AspectRatio(
            aspectRatio: 100 / 80,
            child: Image.asset("assets/images/confirm-modal.png"),
          ),
          Spacer(flex: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Redeem sukses! Total point kamu berhasil dikurangi 600pts.",
              style: TextStyle(
                fontSize: 14.0,
                color: CompanyColors.lightGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 1),
          Text(
            "Enjoy the merchandise!",
            style: TextStyle(fontSize: 18.0),
          ),
          Spacer(flex: 2),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Batal",
              style: TextStyle(
                fontSize: 18.0,
                color: CompanyColors.brown,
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
