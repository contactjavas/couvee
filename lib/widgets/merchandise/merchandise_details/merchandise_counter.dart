import 'package:couvee/company_colors.dart';
import 'package:flutter/material.dart';

enum Actions {
  add,
  minus,
}

typedef void CounterCallback(int pts);

class MerchandiseCounter extends StatefulWidget {
  final int pts;
  final int inStock;
  final CounterCallback callback;
  const MerchandiseCounter({Key key, this.inStock, this.callback, this.pts})
      : super(key: key);

  @override
  _MerchandiseCounterState createState() => _MerchandiseCounterState();
}

class _MerchandiseCounterState extends State<MerchandiseCounter> {
  int counter = 0;

  void handleCounter(Actions actions) {
    if (actions == Actions.add) {
      if (counter < widget.inStock) {
        setState(() {
          counter = counter + 1;
        });
        widget.callback(widget.pts * counter);
      }
    } else if (actions == Actions.minus) {
      if (counter > 0) {
        setState(() {
          counter = counter - 1;
        });
        widget.callback(widget.pts * counter);
      }
    }
  }

  Widget counterButton(Actions actions) {
    return GestureDetector(
      onTap: () {
        handleCounter(actions);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          actions == Actions.add ? "+" : '-',
          style: TextStyle(
            color: CompanyColors.brown,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        children: <Widget>[
          counterButton(Actions.minus),
          Spacer(flex: 1),
          Text(counter.toString()),
          Spacer(flex: 1),
          counterButton(Actions.add)
        ],
      ),
    );
  }
}
