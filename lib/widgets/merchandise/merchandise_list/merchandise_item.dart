import 'package:flutter/material.dart';

class MerchandiseItem extends StatelessWidget {
  final String text;
  final String image;
  const MerchandiseItem({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/merchandiseDetails");
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
