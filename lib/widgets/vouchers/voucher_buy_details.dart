import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:couvee/company_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _Item {
  final String headerValue;
  final String expandedValue;
  bool isExpanded;
  final IconData icon;

  _Item({
    this.headerValue,
    this.expandedValue,
    this.isExpanded,
    this.icon,
  });
}

class VoucherBuyDetails extends StatefulWidget {
  const VoucherBuyDetails({Key key}) : super(key: key);

  @override
  _VoucherBuyDetailsState createState() => _VoucherBuyDetailsState();
}

class _VoucherBuyDetailsState extends State<VoucherBuyDetails> {
  double screenWidth;

  double screenHeight;

  double body1FontSize;

  double subheadFontSize;

  List<_Item> _items = <_Item>[
    new _Item(
      isExpanded: true,
      icon: Icons.info,
      headerValue: 'Voucher Description',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
    new _Item(
      isExpanded: false,
      icon: FontAwesomeIcons.fileAlt,
      headerValue: 'Terms and conditions',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
    new _Item(
      isExpanded: false,
      icon: FontAwesomeIcons.solidQuestionCircle,
      headerValue: 'How to use',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    body1FontSize = Theme.of(context).textTheme.bodyText2.fontSize;
    subheadFontSize = Theme.of(context).textTheme.subtitle1.fontSize;

    return DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.75,
        maxChildSize: 0.9,
        builder: (
          BuildContext context,
          ScrollController scrollController,
        ) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0.0, -5.0),
                  blurRadius: 40.0,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 19.0,
                bottom: 25.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Buy 1 Get 1 Free!",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.solidCalendar,
                            color: CompanyColors.brown,
                            size: 15.0,
                          ),
                          SizedBox(width: 7.0),
                          Text(
                            "Valid hingga 5 Nov, 2019",
                            style: TextStyle(
                              height: 1.1,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(
                          top: 22,
                          bottom: 22,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CompanyColors.brown[50],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 22.0,
                              height: 22.0,
                              child: Image.asset("./assets/images/coin.png"),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "300 ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: CompanyColors.brown,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "pts",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: CompanyColors.brown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanelList(
                        expandedHeaderPadding: EdgeInsets.only(bottom: 14.0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _items[index].isExpanded =
                                !_items[index].isExpanded;
                          });
                        },
                        children: _items.map<ExpansionPanel>((_Item item) {
                          return ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(
                                  item.icon,
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
                              contentPadding: EdgeInsets.zero,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      color: CompanyColors.brown,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ConfirmBuyVoucherModal(),
                          backgroundColor: Colors.grey,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                        );
                      },
                      child: Text(
                        "Beli Vocer",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
