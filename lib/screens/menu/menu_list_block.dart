// Core packages.
import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

// Couvee packages.

// Couvee responses.

class MenuListBlock extends StatelessWidget {
  final ScrollController scrollController;
  final double horizontalPadding = 25.0;

  const MenuListBlock({Key key, @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      children: <Widget>[
        Divider(
          height: 1.0,
          color: CompanyColors.grey.withOpacity(0.1),
          thickness: 1.0,
        ),
        ListTile(
          dense: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          leading: Icon(
            Icons.people_outline,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Kode Referral',
          ),
          title: Text(
            'Kode Referral',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Go',
          ),
        ),
        Divider(
          height: 1.0,
          color: CompanyColors.grey.withOpacity(0.1),
          thickness: 1.0,
        ),
        ListTile(
          dense: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          leading: Icon(
            Icons.help_outline,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Bantuan',
          ),
          title: Text(
            'Bantuan',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Go',
          ),
        ),
        Divider(
          height: 1.0,
          color: CompanyColors.grey.withOpacity(0.1),
          thickness: 1.0,
        ),
        ListTile(
          dense: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          leading: Icon(
            Icons.star_border,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Rating',
          ),
          title: Text(
            'Beri Couvee Rating',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Go',
          ),
        ),
        Divider(
          height: 1.0,
          color: CompanyColors.grey.withOpacity(0.1),
          thickness: 1.0,
        ),
        SizedBox(
          height: 26.0,
        ),
        ListTile(
          dense: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          leading: Icon(
            Icons.exit_to_app,
            color: CompanyColors.brown,
            size: 24.0,
            semanticLabel: 'Logout',
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              color: CompanyColors.brown,
              fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
