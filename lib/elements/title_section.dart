import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../company_colors.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final Widget leading;
  const TitleSection({Key key, this.title, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leading != null
              ? Flexible(flex: 2, child: leading)
              : Flexible(flex: 2, child: SizedBox()),
          Flexible(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: Theme.of(context).textTheme.headline5.fontSize,
                  fontWeight: FontWeight.w500,
                  textStyle: TextStyle(
                    color: CompanyColors.black,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
