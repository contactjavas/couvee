// Core packages.
import 'package:flutter/material.dart';

// Extension packages.
import 'package:google_fonts/google_fonts.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';

class EarningSteps extends StatefulWidget {
  const EarningSteps({
    Key key,
  }) : super(key: key);

  _EarningSteps createState() => _EarningSteps();
}

class _EarningSteps extends State<EarningSteps> {
  List<StepItem> _steps = [
    StepItem(
      1,
      'assets/images/point-earning/outlet.png',
      'Pergi ke outlet',
    ),
    StepItem(
      2,
      'assets/images/point-earning/qrcode.png',
      'Scan QR code dari barista',
    ),
    StepItem(
      3,
      'assets/images/point-earning/rp.png',
      'Input total harga',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _steps,
    );
  }
}

class StepItem extends StatelessWidget {
  final num number;
  final String imageUrl;
  final String title;

  StepItem(
    this.number,
    this.imageUrl,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double stepItemSize = (screenWidth / 3) - 27.0;

    return Container(
      width: stepItemSize,
      height: stepItemSize,
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            number.toString(),
            style: GoogleFonts.kanit(
              fontSize: Theme.of(context).textTheme.caption.fontSize,
              fontWeight: FontWeight.w600,
              textStyle: TextStyle(
                color: CompanyColors.lightGrey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: stepItemSize / 18,
              bottom: stepItemSize / 15,
            ),
            child: Image.asset(
              imageUrl,
              height: 20.5,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: CompanyColors.lightGrey,
              fontSize: Theme.of(context).textTheme.overline.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
