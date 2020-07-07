// Core packages.
import 'package:couvee/company_colors.dart';
import 'package:couvee/screens/screens.dart';
import 'package:flutter/material.dart';

// Extension packages.
import 'package:hive/hive.dart';

// Couvee screens.
import 'package:couvee/screens/pre_login_screen.dart';

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsWrapperScreen(
                  title: 'Referral Code',
                  child: ReferralScreen(),
                ),
              ),
            );
          },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsWrapperScreen(
                  title: 'Help',
                  child: HelpScreen(),
                ),
              ),
            );
          },
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
          onTap: () {
            final userBox = Hive.box('user');
            userBox.put('id', null);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PreLoginScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
