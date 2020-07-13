import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

typedef void Callback(int index);

class VoucherTabs extends StatelessWidget {
  final int activeIndex;
  final Callback callback;
  const VoucherTabs({Key key, this.callback, this.activeIndex})
      : super(key: key);

  Widget tab(active, title, index, callback) {
    return Expanded(
      child: InkWell(
        onTap: () {
          callback(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1),
          curve: Curves.ease,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: active ? CompanyColors.brown : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : CompanyColors.brown,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 0.5, color: CompanyColors.brown),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tab(activeIndex == 0, "Voucherku", 0, callback),
          tab(activeIndex == 1, "Beli Voucher", 1, callback),
        ],
      ),
    );
  }
}
