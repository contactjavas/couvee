import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class ConfirmTransfer extends StatelessWidget {
  const ConfirmTransfer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.0),
      ),
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 100 / 45,
                child: Image.asset("./assets/images/confirmed.png"),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Penambahan point berhasil!",
                style: TextStyle(
                  fontSize: 14.0,
                  color: CompanyColors.lightGrey,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Kamu baru aja dapet 100 pts",
                style: TextStyle(
                  fontSize: 18.0,
                  color: CompanyColors.lightGrey,
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Kembali ke Beranda",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: CompanyColors.brown,
              ),
            ),
          )
        ],
      ),
    );
  }
}
