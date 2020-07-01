import 'package:couvee/screens/screens.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Item> _items = <Item>[
    new Item(
      isExpanded: false,
      headerValue: 'Apa itu Couvee point?',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
    new Item(
      isExpanded: false,
      headerValue: 'Gimana caranya dapet merchandise?',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
    new Item(
      isExpanded: false,
      headerValue: 'Gimana caranya dapet vocer?',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In integer quam mattis lectus lacus. Mauris elementum tempor nunc, in porttitor. Eu eget fermentum laoreet ac elementum nullam. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
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
                    title: Text(
                      item.headerValue,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  );
                },
                body: ListTile(
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
    );
  }
}
