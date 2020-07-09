import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class MerchandiseDetailsItem extends StatelessWidget {
  final String title;
  final String image;
  final int inStock;
  final int pts;
  const MerchandiseDetailsItem(
      {Key key, this.title, this.image, this.inStock, this.pts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(image),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Kembali",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: CompanyColors.brown,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                color: Color.fromRGBO(207, 209, 213, 1),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "$inStock availbe",
                style: TextStyle(
                  fontSize: 12.0,
                  color: CompanyColors.lightGrey,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              RichText(
                text: TextSpan(
                    text: pts.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: CompanyColors.brown,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " pts",
                        style: TextStyle(
                            fontSize: 14.0, color: CompanyColors.brown),
                      ),
                    ]),
              )
            ],
          ),
          Spacer(
            flex: 3,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: FlatButton(
              color: CompanyColors.brown,
              onPressed: () {
                print("presseed");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 14.0,
                    child: Image.asset("assets/images/coin-solid.png"),
                  ),
                  Text(
                    "Redeem",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
