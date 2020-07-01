import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 18.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                './assets/images/history-preview.png',
                width: 60.0,
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Seturan",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CompanyColors.black,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "2 Nov 14:00",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: CompanyColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
                text: "+200 ",
                style: TextStyle(
                  fontSize: 18.0,
                  color: CompanyColors.brown,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: "pts",
                      style: TextStyle(
                          fontSize: 14.0, color: CompanyColors.brown[500]))
                ]),
          )
        ],
      ),
    );
  }
}
