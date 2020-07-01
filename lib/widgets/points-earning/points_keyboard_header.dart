import 'package:couvee/company_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PointsKeyboardHeader extends StatelessWidget {
  final TextEditingController controller;
  const PointsKeyboardHeader({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: CompanyColors.grey[200],
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  EvaIcons.closeCircle,
                  color: Colors.grey,
                  size: 32,
                ),
              ),
            ],
          ),
          Text(
            "Masukkan total pembelian",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[400],
            ),
          ),
          Row(children: <Widget>[
            Text(
              "Rp",
              style: TextStyle(
                fontSize: 42.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 3.0,
            ),
            Flexible(
              flex: 1,
              child: TextFormField(
                controller: controller,
                showCursor: true,
                readOnly: true,
                cursorColor: CompanyColors.lightGrey,
                decoration: InputDecoration(
                  hintText: "0",
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.text = '';
                    },
                    icon: Icon(
                      EvaIcons.closeCircle,
                      color: CompanyColors.lightGrey,
                    ),
                  ),
                  fillColor: Colors.transparent,
                ),
                style: TextStyle(
                  fontSize: 42.0,
                  color: CompanyColors.lightGrey,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
