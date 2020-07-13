import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../company_colors.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key key}) : super(key: key);

  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  List<Item> _items = <Item>[
    new Item(
        isExpanded: false,
        headerValue: 'Apa itu kode referral?',
        expandedValue:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. '),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset('./assets/images/referral.png'),
              SizedBox(
                height: 16.0,
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Text(
                  "Bagikan kode referalmu dan dapatkan 500pts!",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 37.0, bottom: 24.0),
                child: Divider(
                  height: 0.1,
                  color: Colors.grey[200],
                  indent: 26,
                  endIndent: 26,
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  });
                },
                children: _items.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        dense: false,
                        leading: Icon(
                          EvaIcons.questionMarkCircleOutline,
                          color: CompanyColors.brown,
                        ),
                        title: Text(
                          item.headerValue,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    },
                    body: ListTile(
                      leading: SizedBox(),
                      title: Text(
                        item.expandedValue,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
              top: 16,
              bottom: 16,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: CompanyColors.brown[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: DottedBorder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    radius: Radius.circular(10.0),
                    color: CompanyColors.brown[200],
                    borderType: BorderType.RRect,
                    strokeWidth: 1,
                    child: Center(
                      child: Text(
                        "1123efdfer34",
                        style: TextStyle(
                            fontSize: 20.0, color: CompanyColors.brown),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                  child: FlatButton(
                    onPressed: () {},
                    color: CompanyColors.brown,
                    child: Text(
                      "Salin Kodemu",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
