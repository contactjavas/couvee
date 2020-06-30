// Core packages.
import 'package:flutter/material.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

// Couvee responses.
import 'package:couvee/responses/auth_response.dart';

class AccountPreviewBlock extends StatelessWidget {
  final UserData user;
  final double horizontalPadding = 25.0;

  const AccountPreviewBlock({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          margin: EdgeInsets.only(
            top: 22.0,
            bottom: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.user.firstName,
                      style: TextStyle(
                        color: CompanyColors.black,
                        fontSize:
                            Theme.of(context).textTheme.subtitle1.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      this.user.email,
                      style: TextStyle(
                        color: CompanyColors.black,
                        fontSize: Theme.of(context).textTheme.caption.fontSize,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      this.user.phone,
                      style: TextStyle(
                        color: CompanyColors.black,
                        fontSize: Theme.of(context).textTheme.caption.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: 70.0,
                  height: 35.0,
                  child: FlatButton(
                    color: CompanyColors.brown,
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
