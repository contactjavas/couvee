import 'package:couvee/company_colors.dart';
import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

typedef void HandlePts(int pts);

class MerchandiseDetailsItem extends StatefulWidget {
  final String title;
  final String image;
  final int inStock;
  final int pts;
  final HandlePts handlePts;
  const MerchandiseDetailsItem(
      {Key key, this.title, this.image, this.inStock, this.pts, this.handlePts})
      : super(key: key);

  @override
  _MerchandiseDetailsItemState createState() => _MerchandiseDetailsItemState();
}

class _MerchandiseDetailsItemState extends State<MerchandiseDetailsItem> {
  bool selected = false;

  void handleSelect() {
    setState(() {
      selected = !selected;
    });
  }

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
                    return MerchandiseViewProductModal(
                      image: widget.image,
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                color: Color.fromRGBO(207, 209, 213, 1),
                width: 100,
                height: 100,
                child: Image.asset(
                  widget.image,
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
                widget.title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "${widget.inStock} availbe",
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
                    text: widget.pts.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: CompanyColors.brown,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " pts",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: CompanyColors.brown,
                        ),
                      ),
                    ]),
              )
            ],
          ),
          Spacer(
            flex: 3,
          ),
          selected
              ? MerchandiseCounter(
                  pts: widget.pts,
                  inStock: widget.inStock,
                  callback: widget.handlePts,
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: FlatButton(
                    color: CompanyColors.brown,
                    onPressed: () {
                      handleSelect();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 14.0,
                          child: Image.asset("assets/images/coin-solid.png"),
                        ),
                        SizedBox(width: 3),
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
