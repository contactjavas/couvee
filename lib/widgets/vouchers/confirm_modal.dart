import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class ConfirmVoucherModal extends StatelessWidget {
  const ConfirmVoucherModal({Key key}) : super(key: key);

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
                child: Image.asset("./assets/images/confirm-voucher.png"),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Apa kamu yakin?",
                style: TextStyle(
                  fontSize: 18.0,
                  color: CompanyColors.black,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "Pastikan kamu udah nunjukin vocer ini ke barista dan persilahkan barista kami yang menggunakan vocer ini.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: CompanyColors.lightGrey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Pakai Vocer",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: CompanyColors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: FlatButton(
                  color: CompanyColors.brown,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Pakai Vocer",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}