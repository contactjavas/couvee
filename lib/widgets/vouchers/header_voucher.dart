import 'package:flutter/material.dart';

class VoucherHeaderImage extends StatelessWidget {
  final String url;
  const VoucherHeaderImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
