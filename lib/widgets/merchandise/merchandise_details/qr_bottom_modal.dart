import 'package:couvee/company_colors.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QrBottomModal extends StatelessWidget {
  const QrBottomModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.68,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 2),
          AspectRatio(
            aspectRatio: 100 / 70,
            child: Image.asset("assets/images/qr-code.png"),
          ),
          Spacer(flex: 2),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Tunjukkan  QRcode ini ke barista dan silahkan tunggu.",
              style: TextStyle(
                fontSize: 18.0,
                color: CompanyColors.lightGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 2),
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
                    return MerchandiseConfirmModal();
                  });
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
