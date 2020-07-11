import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

class MerchandiseViewProductModal extends StatelessWidget {
  final String image;
  const MerchandiseViewProductModal({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
