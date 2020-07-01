import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class WaitingTransfer extends StatelessWidget {
  const WaitingTransfer({Key key}) : super(key: key);

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
                aspectRatio: 100 / 50,
                child: Image.asset("./assets/images/waiting.png"),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  value: 0.20,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Menunggu respon barista",
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
              "Batal",
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
